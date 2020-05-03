-module(erl_3).

-export([lang_receiver/0]).

-export([lang_receiver_synchronus/0]).

-export([spawn_lang_receiver/0]).

-export([spawn_synchronous_lang_receiver/0]).

-export([spawn_roulette/0]).

-export([send_message_by_pid/2]).

-export([send_message_by_pid_synchronously/2]).

-export([shout/2]).

-export([process_tracker/0]).

-export([process_tracker_demo/0]).

-export([monitor/0]).

-export([process_monitor_tracker_demo/0]).

% Concurrency primitives

    % sending a message (via !)
    % spawning a process (via spawn)
    % receiving a message (via receive)

% Asynchronous message handling
lang_receiver() ->
    receive
      "java" ->
	  io:format("Java is a statically typed lang.~n"),
	  lang_receiver();
      "ruby" ->
	  io:format("Ruby is dynamically typed lang.~n"),
	  lang_receiver();
      _ -> io:format("Unknown lang.~n")
    end.

spawn_lang_receiver() -> spawn(fun lang_receiver/0).

send_message_by_pid(Pid, Message) -> Pid ! Message.

lang_receiver_synchronus() ->
    receive
      {Pid, "java"} ->
	  Pid ! "statically typed", lang_receiver_synchronus();
      {Pid, "ruby"} ->
	  Pid ! "dynamically typed", lang_receiver_synchronus();
      _ -> "Unknown lang."
    end.

% Synchronus message handling
spawn_synchronous_lang_receiver() ->
    spawn(fun lang_receiver_synchronus/0).

send_message_by_pid_synchronously(Pid, Message) ->
    Pid ! {self(), Message}, receive Result -> Result end.

% Linking processes
roulette() ->
    receive
      3 ->
	  io:format("killed the process ~n"),
	  exit({roulette, die, at, erlang:time()});
      _ -> io:format("missed~n"), roulette()
    end.

spawn_roulette() -> spawn(fun roulette/0).

shout(RoulettePid, Chamber) ->
    IsAlive = erlang:is_process_alive(RoulettePid),
    if IsAlive -> RoulettePid ! Chamber;
       true -> "The process id dead"
    end.

process_tracker() ->
    process_flag(trap_exit, true),
    receive
      {monitor, Process} ->
	  link(Process),
	  io:format("Monitoring process.~n"),
	  process_tracker();
      {'EXIT', From, Reason} ->
	  io:format("The shooter ~p died with reason ~p. ",
		    [From, Reason]),
	  io:format("Start another one.~n"),
	  process_tracker()
    end.

process_tracker_demo() ->
    RouletteProcess = spawn_roulette(),
    ProcessTracker = spawn(fun process_tracker/0),
    ProcessTracker ! {monitor, RouletteProcess},
    % Play the game
    shout(RouletteProcess, 1),
    timer:sleep(1),
    shout(RouletteProcess, 2),
    timer:sleep(1),
    shout(RouletteProcess, 3).

% Monitoring process death and re-spawning it

monitor() ->
    process_flag(trap_exit, true),
    receive
      new ->
	  io:format("Creating and monitoring roulette process.~n"),
	  % Binds roulette process to `roulette_pid` atom (symbol)
	  register(roulette_pid, spawn_link(fun roulette/0)),
	  monitor();
      {'EXIT', From, Reason} ->
	  io:format("The shouter ~p died with reason ~p.",
		    [From, Reason]),
	  io:format("Restarting. ~n"),
	  self() ! new,
	  monitor()
    end.

% c(erl_3).
% erl_3:process_monitor_tracker_demo().
process_monitor_tracker_demo() ->
    Monitor = spawn(fun monitor/0),
    Monitor ! new,
    timer:sleep(1),
    roulette_pid ! 1,
    roulette_pid ! 2,
    roulette_pid ! 3,
    timer:sleep(1),
    roulette_pid ! 1.
