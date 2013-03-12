
:- use_module(library(lists)).
%course(X,Y) means that course X has Y groups. course(csen403,4). 
course(csen401,4). %course(math401,4,[t07,t08,t09,t10,t11,all_group_4]). 
course(elct401,4). course(maths4,4). course(comm401,4). 
course(csen402,4).


totalcourses(6).


totalmeetings(csen403,5). 
course_meetings(csen403,lab,t07,nada_sharaf,'lab for t07'). 
course_meetings(csen403,lab,t08,nada_sharaf,'lab for t08'). 
course_meetings(csen403,lab,t09,nada_sharaf,'lab for t09'). 
course_meetings(csen403,lab,t10,nada_sharaf,'lab for t10').

course_meetings(csen403,lecture,all_group_4,prof_slim,'lecture1').

totalmeetings(csen401,5).

course_meetings(csen401,lecture,all_group_4,prof_slim,'lecture').

course_meetings(csen401,lab,t07,nermeen_abdel_aziz,'lab for t07'). 
course_meetings(csen401,lab,t08,injy_khairy,'lab for t08'). 
course_meetings(csen401,lab,t09,nermeen_abdel_aziz,'lab for t09'). 
course_meetings(csen401,lab,t10,injy_khairy,'lab for t010').


totalmeetings(elct401,9).

course_meetings(elct401,lecture,all_group_4,dr_yasser_hegazy,'lecture 
1').

course_meetings(elct401,lab,t07,ahmed_ragheb,'lab for t07'). 
course_meetings(elct401,lab,t08,samar_mohamed,'lab for t08'). 
course_meetings(elct401,lab,t09,ahmed_ragheb,'lab for t09'). 
course_meetings(elct401,lab,t10,samar_mohamed,'lab for t10').

course_meetings(elct401,tutorial,t07,yasmmine_hassan,'tutorial for 
t07'). course_meetings(elct401,tutorial,t08,yasmmine_hassan,'tutorial 
for t08'). course_meetings(elct401,tutorial,t09,sara_mohamed,'tutorial 
for t09'). course_meetings(elct401,tutorial,t10,sara_mohamed,'tutorial 
for t10').

totalmeetings(maths4,6).

course_meetings(maths4,tutorial,t07,khaled_mohamed,'tutorial for t07'). 
course_meetings(maths4,tutorial,t08,tarek_mounir,'tutorial for t08'). 
course_meetings(maths4,tutorial,t09,khaled_mohamed,'tutorial for t09'). 
course_meetings(maths4,tutorial,t10,hany_elsharkawy,'tutorial for t10'). 
course_meetings(maths4,lecture,all_group_4,prof_bauman,'lecture 1'). 
course_meetings(maths4,lecture,all_group_4,prof_bauman,'lecture 2').


totalmeetings(comm401,5). 
course_meetings(comm401,tutorial,t07,mohamed_esameldin,'tutorial for 
t07'). course_meetings(comm401,tutorial,t08,sally_mahmoud,'tutorial for 
t08'). course_meetings(comm401,tutorial,t09,mohamed_esameldin,'tutorial 
for t09'). course_meetings(comm401,tutorial,t10,sally_mahmoud,'tutorial 
for t10'). 
course_meetings(comm401,lecture,all_group_4,dr_amr_talaat,'lecture 1').

totalmeetings(csen402,5). 
course_meetings(csen402,tutorial,t07,nehal,'tutorial for t07'). 
course_meetings(csen402,tutorial,t08,nehal,'tutorial for t08'). 
course_meetings(csen402,tutorial,t09,noura_maghawry,'tutorial for t09'). 
course_meetings(csen402,tutorial,t10,noura_maghawry,'tutorial for t10'). 
course_meetings(csen402,lecture,all_group_4,dr_cherif_salama,'lecture 
1').

labs([c7201,c6209,c7220]). lecturehalls([h3]). 
tutorialrooms([c6301,b4108,c2201,c2301,c2202,c2203]).

days([saturday,sunday,monday,tuesday,wednesday,thursday]).

group(4,[t07,t08,t09,t10,all_group_4]).


totalgroups(1).

slots([[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17],[18],[19],[20],[21],[22],[23],[24],[25],[26],[27],[28],[29],[30]]).
												%enumeration for slots in form of lists 1 - 30





foo(0,L,R,[H],R):-
	L = [H|T].

foo(1,L,R,L,R).

foo(N,L,[H|T],E,F):-							      %helper for create schedule simply fills each slot horizontally 
									      %according to the random variable N
	N\=1,
	length([H|T],N2),
	N2>=N,
	nth0(1,H,Type),
	nth0(2,H,Group),
	nth0(3,H,Instruc),
	nth0(3,L,Group1),
	nth0(4,L,Instruc1),
	Type==tutorial,
	Group\==Group1,Instruc\==Instruc1,
	tutorialrooms(X),
	random(0,6,N3),
	nth0(N3,X,Room),
	append(L,H,L1),
	append(L1,[Room],L2),
	N1 is N-1,
	foo(N1,L2,T,E,F).

foo(N,L,[H|T],E,F):-							      %helper for create schedule simply fills each slot horizontally 
									      %according to the random variable N
	N\=1,
	length([H|T],N2),
	N2>=N,
	nth0(1,H,Type),
	nth0(2,H,Group),
	nth0(3,H,Instruc),
	nth0(3,L,Group1),
	nth0(4,L,Instruc1),
	Type==lab,
	Group\==Group1,Instruc\==Instruc1,
	labs(X),
	random(0,3,N3),
	nth0(N3,X,Room),
	append(L,H,L1),
	append(L1,[Room],L2),
	N1 is N-1,
	foo(N1,L2,T,E,F).


createSchedule([],[],F,_,_,_).

createSchedule([H|T],[],[H1|T1],_,_,_):-
	H1 = H,
	createSchedule(T,[],T1,_,_,_).
	

createSchedule([H|T],[H1|T1],[H4|T4],LastLec,LastTut,LastLab):-						%fills schedule from 1 to 30 slots
	append(H,H1,H2),
	random(0,4,X),
	nth0(2,H2,Type),Type==lecture,
	append(H2,[h3],H3),
	foo(1,H3,T1,H5,T2),
	not_same_day(LastLecture,H5),
	H4 = H5,
	createSchedule(T,T2,T4,H5,LastTut,LastLab).

createSchedule([H|T],[H1|T1],[H4|T4],LastLec,LastTut,LastLab):-						%fills schedule from 1 to 30 slots
	append(H,H1,H2),
	random(0,4,X),
	nth0(2,H2,Type),Type==lab,
	labs(L),
	random(0,3,N),
	nth0(N,L,Z),
	append(H2,[Z],H3),
	foo(X,H3,T1,H5,T2),
	%tut_preceed_lab(LastTut,H5),
	H4 = H5,
	createSchedule(T,T2,T4,LastLec,LastTut,H5).

createSchedule([H|T],[H1|T1],[H4|T4],LastLec,LastTut,LastLab):-						%fills schedule from 1 to 30 slots
	append(H,H1,H2),
	random(0,4,X),
	nth0(2,H2,Type),Type==tutorial,
	tutorialrooms(L),
	random(0,6,N),
	nth0(N,L,Z),
	append(H2,[Z],H3),
	foo(X,H3,T1,H5,T2),
	%tut_preceed_lab(H5,LastLab),
	H4 = H5,
	createSchedule(T,T2,T4,LastLec,H5,LastLab).




isValid(S):-
	totalmeetings(Course,N),
	max_meetings(Course,S,N1),
	N==N1.
	

not_same_day([],_).
not_same_day(_,[]).
not_same_day(List1,List2):-
	nth0(2,List1,Type1),
	nth0(2,List2,Type2),
	Type1 == Type2 == lecture,
	nth0(1,List1,Course1),
	nt0(1,List2,Course2),
	Course1==Course2,
	nth0(0,List1,Slot1),
	nth0(0,List2,Slot2),
	X is (Slot1-1)//5, Y is (Slot2-1)//5,
	X\==Y.


tut_preceed_lab([],_).
tut_preceed_lab(_,[]).
tut_preceed_lab(List1,List2):-
	nth0(2,List1,Type1),
	nth0(2,List2,Type2),
	Type1 == tutorial,Type2==lab,
	nth0(1,List1,Course1),
	nth0(1,List2,Course2),
	Course1==Course2,
	nth0(0,List1,Slot1),
	nth0(0,List2,Slot2),
	X is (Slot1-1)//5, Y is (Slot2-1)//5,
	X<Y.


	

max_meetings(_,[],0).

max_meetings(Course,[H|T],N):-	
	nth0(1,H,Y),
	Y==Course,
	max_meetings(Course,T,N1),
	N is N1+1.	
max_meetings(Course,[H|T],N):-
	nth0(1,H,Y),
	Y\==Course,
	max_meetings(Course,T,N).

get_lists(R,X):-
	findall([A,B,C,D,E],course_meetings(A,B,C,D,E),R),slots(X).


solve:-
	get_lists(R,X),
	permutation(R,L),
	createSchedule(X,R,Schedule,[],[],[]),
	writeStuff(Schedule).
	
	




are_same(X,Y):-
	X==Y.

getDay(Slot,Day):-
	Index is (Slot-1)//5,
	days(X),
	nth0(Index,X,Day).

writeStuff([]).
writeStuff([H|T]):-
	length(H,N),
	N>1,
	H = [H1|T1],
	getDay(H1,Day),
	write(Day),write(' '),
	write(H1),write(':'),
	write(' '),write(T1),
	write('\n'),
	writeStuff(T).

writeStuff([H|T]):-
	length(H,N),
	N==1,
	nth0(0,H,Slot),
	getDay(H,Day),
	write(Day),write(' '),
	write(Slot),write(':'),
	write('\n'),
	writeStuff(T).
	
	
	
	
	

	

	

	
	
	












	
	
	

	





	


	
	
	





	
	
	
	
	
		 










    
    
    
    
    
