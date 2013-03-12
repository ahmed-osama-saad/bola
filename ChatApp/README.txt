This is the readme file for the chat application

Instructions : 

1)Run Main class
2)Run Client Class, for more instances of clients run client again.
3)Once the Client GUI frames open enter your username pressing enter	
  is the default send command.
4)If your username is unique you will be succesffuly admitted into the server
  lobby and be able to view messages from other users.else you will be prompted
  to enter a different username.
5)write any message and press return and you can send and view

ROOM COMMANDS : 
	
	FILE->CREATE->PUBLIC/PRIVATE CHATROOM :-
	
 	CREATES a new tab on the gui representing a chatroom with the creator of
	the room as admin, chatroom names are auto assigned by suffixing the 
	creator name with a "/n" n representing a unique no. 
	
	ROOM->INVITE :- pressing the invite button prompts entry of name of client
				 	to be invited.On acceptance an identical tab to the admin's
					tab is created on the invitee gui and message exchange proceeds
					normally.
	
	ROOM->WHO :- Returns a list of members currently logged on this chatroom.
	
	ROOM->KICKOFF :- prompts entry of username to be kicked off this room.

	ROOM->CLOSE :- closes a particular chatroom tab, if user of this command
				   was an admin all tabs representing this chatroom on all members
				   guis will be deleted accordingly, else the user if not an
				   admin will only be removed from the member list of this chatroom.

	ROOM->MUTE/UN:- prompts entry of username to be muted or unmuted depending
					on his current state i.e muted or unmuted if the username
					entered was already muted he will be unmuted and vice versa.

GENERAL COMMANDS:-

	FILE->JOIN:- prompts entry of chatroom name you wish to join while at
				 the same time displaying all public chatrooms names
				 currently on server on the lobby textarea, after entering
				 the name and server approving joining a tab representing the
				 chatroom is created on the joiner gui.

	FILE->UPLOAD->TCP :- opens a file chooser gui where a user can choose a
						 particular file to upload over tcp and then prompts
						 the user to enter name of person he/she wishes to
						 send file to after upload time taken to upload file
						 to server is shown on client UI, once file is on
						 server, the server sends a message to the recieving
						 client indicating file name and sender name and asks
						 for approval,on approval file is sent and a new
						 file chooser pops up where user can choose any "FILE"
						 on a directory he wishes to save file to and file 
						 is saved on this directory.
						
						**NOTE** reciving client does not choose a directory
								 he chooses a file in a directory and file 
								 is saved on that directory.
	
	FILE->UPLOAD->UDP :- same as above.

	FILE->OPTIONS->WHO IS HERE ?->Client list logged on Server.
	
	FILE->CHATROOMLIST-> Chat Room Names on server.

	FILE->EXIT->closes client same as close button on frame itself.

	
	
-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-END-OF-README-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x
