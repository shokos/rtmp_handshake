%% @copyright 2013 Takeru Ohta <phjgt308@gmail.com>
%%
%% @doc RTMP Handshake Interface module
-module(rtmp_handshake_interface).

-include("../include/rtmp_handshake_internal.hrl").

%%--------------------------------------------------------------------------------
%% Exported API
%%--------------------------------------------------------------------------------
-export_type([
              client_state/0
             ]).

%%--------------------------------------------------------------------------------
%% Callback API
%%--------------------------------------------------------------------------------
-callback client_init(#handshake_option{}) -> {ok, client_state()}.
-callback c0(client_state(), #handshake_option{}) -> {ok, rtmp_handshake:rtmp_version(), client_state()} | {error, Reason::term()}.
-callback c1(client_state(), #handshake_option{}) -> {ok, C1Packet::binary(), client_state()} | {error, Reason::term()}.
-callback c2(rtmp_handshake:peer_version(), S1Pakcet::binary(), client_state(), #handshake_option{}) -> {ok, C2Packet::binary(), client_state()} | {error, Reason::term()}.
-callback client_finish(S2Packet::binary(), client_state(), #handshake_option{}) -> ok | {error, Reason::term()}.

%%--------------------------------------------------------------------------------
%% Types
%%--------------------------------------------------------------------------------
-type client_state() :: term().