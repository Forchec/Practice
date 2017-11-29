% Conner Forché Prolog Solution
% checks if line segment is vertical takes two points
vertical(segment(point2d(X,Y), point2d(X, Y2))).

% checks if line segment is horizontal takes two points
horizontal(segment(point2d(X,Y), point2d(X2, Y))).

% checks if line segment is horizontal takes one point and one slope
horizontal(segment(point2d(X,Y), S, L)) :-
	S =:= 0.

% checks if lines are parallel using only points
parallel(
	segment(point2d(X,Y), point2d(X2, Y2)),
	segment(point2d(X3,Y3), point2d(X4, Y4))) :-
	((Y2 - Y)/ (X2 - X)) =:= ((Y4 - Y3)/(X4 - X3)).

% checks if lines are parallel using point and slope for the first line and two points for the second line
parallel(
	segment(point2d(X,Y), S, L),
	segment(point2d(X3,Y3), point2d(X4, Y4))) :-
	S =:= ((Y4 - Y3)/(X4 - X3)).

% checks if lines are parallel using two points for the first line and one point and a slope for the second line
parallel(
	segment(point2d(X,Y), point2d(X2, Y2)),
	segment(point2d(X3,Y3), S, L)) :-
	((Y2 - Y)/ (X2 - X)) =:= S.

% checks if lines are parallel using point and slope for the first line and point and slope for the second line
parallel(
	segment(point2d(X,Y), S1, L),
	segment(point2d(X3,Y3), S2, L)) :-
	S1 =:= S2.

% checks if lines are perpendicular using only points
perpendicular(
	segment(point2d(X,Y), point2d(X2, Y2)),
	segment(point2d(X3,Y3), point2d(X4, Y4))) :-
	((-1 / ((Y2 - Y)/ (X2 - X))) =:= ((Y4 - Y3)/(X4 - X3));
	 (((Y2 - Y)/ (X2 - X)) =:= (-1 / ((Y4 - Y3)/(X4 - X3))))).

% checks if lines are perpendicular using point and slope for the first line and two points for the second line
perpendicular(
	segment(point2d(X,Y), S, L),
	segment(point2d(X3,Y3), point2d(X4, Y4))) :-
	((-1 / S) =:= ((Y4 - Y3)/(X4 - X3));
	 ((S) =:= (-1 / ((Y4 - Y3)/(X4 - X3))))).

% checks if lines are perpendicular using two points for the first line and one point and a slope for the second line
perpendicular(
	segment(point2d(X,Y), point2d(X2, Y2)),
	segment(point2d(X3,Y3), S, L)) :-
	((-1 / ((Y2 - Y)/ (X2 - X))) =:= (S);
	 (((Y2 - Y)/ (X2 - X)) =:= (-1 / (S)))).

% checks if lines are perpendicular using point and slope for the first line and point and slope for the second line
perpendicular(
	segment(point2d(X,Y), S1, L),
	segment(point2d(X3,Y3), S2, L)) :-
	((-1 / (S1)) =:= S2;
	 S1 =:= (-1 / (S2))).

% checks if segment is contained in this rectangle using two points for the segment
contained(
	segment(point2d(X,Y), point2d(X2, Y2)),
	rectangle(point2d(LeftX, LeftY), point2d(RightX, RightY))) :-
	Y =< LeftY,
	Y2 =< LeftY,
	Y >= RightY,
	Y2 >= RightY,
	X >= LeftX,
	X2 >= LeftX,
	X =< RightX,
	X2 =< RightX.

% checks if segment is contained in this rectangle using point and slope for the segment
contained(
	segment(point2d(X,Y), S, L),
	rectangle(point2d(LeftX, LeftY), point2d(RightX, RightY))) :-
	Y =< LeftY,
	(Y+(L*S)/(sqrt(1+(S*S)))) =< LeftY,
	Y >= RightY,
	(Y+(L*S)/(sqrt(1+(S*S)))) >= RightY,
	X >= LeftX,
	(X+(L)/(sqrt(1+(S*S)))) >= LeftX,
	X =< RightX,
	(X+(L)/(sqrt(1+(S*S)))) =< RightX.

% checks if segment is contained in this square using two points for the segment
contained(
	segment(point2d(X,Y), point2d(X2, Y2)),
	square(point2d(LeftX, LeftY), L)) :-
	Y =< LeftY,
	Y2 =< LeftY,
	Y >= (LeftY - L),
	Y2 >= (LeftY - L),
	X >= LeftX,
	X2 >= LeftX,
	X =< (LeftX + L),
	X2 =< (LeftX + L).

% checks if segment is contained in this square using point and slope for the segment
contained(
	segment(point2d(X,Y), S, L),
	square(point2d(LeftX, LeftY), L)) :-
	Y =< LeftY,
	(Y+(L*S)/(sqrt(1+(S*S)))) =< LeftY,
	Y >= (LeftY - L),
	(Y+(L*S)/(sqrt(1+(S*S)))) >= (LeftY - L),
	X >= LeftX,
	(X+(L)/(sqrt(1+(S*S)))) >= LeftX,
	X =< (LeftX + L),
	(X+(L)/(sqrt(1+(S*S)))) =< (LeftX + L).

% checks if segment is contained in this circle using two points for the segment
contained(
	segment(point2d(X,Y), point2d(X2, Y2)),
	circle(point2d(CenterX, CenterY), R)) :-
	Y =< (CenterY + R),
	Y2 =< (CenterY + R),
	Y >= (CenterY - R),
	Y2 >= (CenterY - R),
	X >= (CenterX - R),
	X2 >= (CenterX - R),
	X =< (CenterX + R),
	X2 =< (CenterX + R).

% checks if segment is contained in this circle using point and slope for the segment
contained(
	segment(point2d(X,Y), S, L),
	circle(point2d(CenterX, CenterY), R)) :-
	Y =< (CenterY + R),
	(Y+(L*S)/(sqrt(1+(S*S)))) =< (CenterY + R),
	Y >= (CenterY - R),
	(Y+(L*S)/(sqrt(1+(S*S)))) >= (CenterY - R),
	X >= (CenterX - R),
	(X+(L)/(sqrt(1+(S*S)))) >= (CenterX - R),
	X =< (CenterX + R),
	(X+(L)/(sqrt(1+(S*S)))) =< (CenterX + R).

% checks if square is contained in this square
contained(
	square(point2d(LeftX1, LeftY1), L1),
	square(point2d(LeftX2, LeftY2), L2)) :-
	LeftY1 =< LeftY2,
	(LeftY1-L1) >= (LeftY2 - L),
	(LeftX1+L1) =< (LeftY2 + L),
	LeftX1 >= (LeftX2).

% checks if square is contained in this rectangle
contained(
	square(point2d(LeftX1, LeftY1), L1),
	rectangle(point2d(LeftX, LeftY), point2d(RightX, RightY))) :-
	LeftY1 =< LeftY,
	(LeftY1-L1) >= RightY,
	(LeftX1+L1) =< RightX,
	LeftX1 >= LeftX.

% checks if square is contained in this circle
contained(
	square(point2d(LeftX1, LeftY1), L1),
	circle(point2d(CenterX, CenterY), R)) :-
	LeftY1 =< (CenterY + R),
	(LeftY1-L1) >= (CenterY - R),
	(LeftX1+L1) =< (CenterX + R),
	LeftX1 >= (CenterX - R).

% checks if rectangle is contained in this square
contained(
	rectangle(point2d(LeftX, LeftY), point2d(RightX, RightY)),
	square(point2d(LeftX2, LeftY2), L2)) :-
	LeftY =< LeftY2,
	RightY >= (LeftY2 - L),
	RightX =< (LeftY2 + L),
	LeftX >= (LeftX2).
% checks if rectangle is contained in this rectangle
contained(
	rectangle(point2d(LeftX, LeftY), point2d(RightX, RightY)),
	rectangle(point2d(LeftX2, LeftY2), point2d(RightX2, RightY2))) :-
	LeftY =< LeftY2,
	RightY >= RightY2,
	RightX =< RightX2,
	LeftX >= LeftX2.

% checks if rectangle is contained in this circle
contained(
	rectangle(point2d(LeftX, LeftY), point2d(RightX, RightY)),
	circle(point2d(CenterX, CenterY), R)) :-
	LeftY =< (CenterY + R),
	RightY >= (CenterY - R),
	RightX =< (CenterX + R),
	LeftX >= (CenterX - R).

% checks if circle is contained in this square
contained(
	circle(point2d(CenterX1, CenterY1), R1),
	square(point2d(LeftX2, LeftY2), L2)) :-
	(CenterY1 + R1) =< LeftY2,
	(CenterY1 - R1) >= (LeftY2 - L),
	(CenterX1 + R1) =< (LeftY2 + L),
	(CenterX1 - R1) >= (LeftX2).

% checks if circle is contained in this rectangle
contained(
	circle(point2d(CenterX1, CenterY1), R1),
	rectangle(point2d(LeftX2, LeftY2), point2d(RightX2, RightY2))) :-
	(CenterY1 + R1) =< LeftY2,
	(CenterY1 - R1) >= RightY2,
	(CenterX1 + R1) =< RightX2,
	(CenterX1 - R1) >= LeftX2.

% checks if circle is contained in this circle
contained(
	circle(point2d(CenterX1, CenterY1), R1),
	circle(point2d(CenterX2, CenterY2), R2)) :-
	(CenterY1 + R1) =< (CenterY2 + R2),
	(CenterY1 - R1) >= (CenterY2 - R2),
	(CenterX1 + R1) =< (CenterX2 + R2),
	(CenterX1 - R1) >= (CenterX2 - R2).


% does square intersect rectangle
intersects(
	square(point2d(LeftX1, LeftY1), L1),
	rectangle(point2d(LeftX2, LeftY2), point2d(RightX2, RightY2))) :-
	(LeftY1 >= RightY2),
	((LeftY1-L1) =< LeftY2),
	(LeftX1 =< RightX2),
	((LeftX1+L1) >= LeftX2).

% does square intersect square
intersects(
	square(point2d(LeftX1, LeftY1), L1),
	square(point2d(LeftX2, LeftY2), L2)) :-
	LeftY1 >= (LeftY2-L2),
	(LeftY1-L1) =< LeftY2,
	LeftX1 =< (LeftX2+L2),
	(LeftX1+L1) >= LeftX2.

% does square intersect segment using two points
intersects(
	square(point2d(LeftX1, LeftY1), L1),
	segment(point2d(X,Y), point2d(X2, Y2))) :-
	(LeftY1 >= Y2),
	((LeftY1-L1) =< Y),
	(LeftX1 =< X2),
	((LeftX1+L1) >= X).

% does square intersect segment using one point, slope and length
intersects(
	square(point2d(LeftX1, LeftY1), L1),
	segment(point2d(X,Y), S, L)) :-
	(LeftY1 >= (Y+(L*S)/(sqrt(1+(S*S))))),
	((LeftY1-L1) =< Y),
	(LeftX1 =< (X+(L)/(sqrt(1+(S*S))))),
	((LeftX1+L1) >= X).

% does square intersect circle
intersects(
	square(point2d(LeftX1, LeftY1), L1),
	circle(point2d(CenterX, CenterY), R)) :-
	LeftY1 >= (CenterY-R),
	(LeftY1-L1) =< (CenterY+R),
	LeftX1 =< (CenterX+R),
	(LeftX1+L1) >= (CenterX-R).

% does rectangle intersect square
intersects(
	rectangle(point2d(LeftX1, LeftY1), point2d(RightX1, RightY1)),
	square(point2d(LeftX2, LeftY2), L2)) :-
	LeftY1 >= (LeftY2-L2),
	RightY1 =< LeftY2,
	LeftX1 =< (LeftX2+L2),
	RightX1 >= LeftX2.

% does rectangle intersect segment using two points
intersects(
	rectangle(point2d(LeftX1, LeftY1), point2d(RightX1, RightY1)),
	segment(point2d(X,Y), point2d(X2, Y2))) :-
	LeftY1 >= Y2,
	RightY1 =< Y,
	LeftX1 =< X2,
	RightX1 >= X.

% does rectangle intersect segment using one point and slope and length
intersects(
	rectangle(point2d(LeftX1, LeftY1), point2d(RightX1, RightY1)),
	segment(point2d(X,Y), S, L)) :-
	LeftY1 >= (Y+(L*S)/(sqrt(1+(S*S)))),
	RightY1 =< Y,
	LeftX1 =< (X+(L)/(sqrt(1+(S*S)))),
	RightX1 >= X.

% does rectangle intersect rectangle
intersects(
	rectangle(point2d(LeftX1, LeftY1), point2d(RightX1, RightY1)),
	rectangle(point2d(LeftX2, LeftY2), point2d(RightX2, RightY2))) :-
	LeftY1 >= RightY2,
	RightY1 =< LeftY2,
	LeftX1 =< RightX2,
	RightX1 >= LeftX2.

% does rectangle intersect circle
intersects(
	rectangle(point2d(LeftX1, LeftY1), point2d(RightX1, RightY1)),
	circle(point2d(CenterX, CenterY), R)) :-
	LeftY1 >= (CenterY-R),
	RightY1 =< (CenterY+R),
	LeftX1 =< (CenterX+R),
	RightX1 >= (CenterX-R).

% does circle intersect square
intersects(
	circle(point2d(CenterX, CenterY), R),
	square(point2d(LeftX2, LeftY2), L2)) :-
	(CenterY+R) >= (LeftY2-L2),
	(CenterY-R) =< LeftY2,
	(CenterX-R) =< (LeftX2+L2),
	(CenterX+R) >= LeftX2.

% does circle intersect segment with two points
intersects(
	circle(point2d(CenterX, CenterY), R),
	segment(point2d(X,Y), point2d(X2, Y2))) :-
	(CenterY+R) >= Y2,
	(CenterY-R) =< Y,
	(CenterX-R) =< X2,
	(CenterX+R) >= X,
	D1 = sqrt((CenterX-X)*(CenterX-X)+(CenterY-Y)*(CenterY-Y)),
	D2 = sqrt((X2-X)*(X2-X)+(Y2-Y)*(Y2-Y)),
	D3 = sqrt((CenterX-X2)*(CenterX-X2)+(CenterY-Y2)*(CenterY-Y2)),
	R >= sqrt(D1*D1 + (1/4)*D2*D2 - D1*D2*((D2*D2+D1*D1-D3*D3)/(2*D2*D1))).

% does circle intersect segment with one point and slope and length
intersects(
	circle(point2d(CenterX, CenterY), R),
	segment(point2d(X,Y), S, L)) :-
	(CenterY+R) >= (Y+(L*S)/(sqrt(1+(S*S)))),
	(CenterY-R) =< Y,
	(CenterX-R) =< (X+(L)/(sqrt(1+(S*S)))),
	(CenterX+R) >= Y,
	X2 is (X+(L)/(sqrt(1+(S*S)))),
	Y2 is (Y+(L*S)/(sqrt(1+(S*S)))),
	D1 is sqrt((CenterX-X)*(CenterX-X)+(CenterY-Y)*(CenterY-Y)),
	D2 is sqrt((X2-X)*(X2-X)+(Y2-Y)*(Y2-Y)),
	D3 is sqrt((CenterX-X2)*(CenterX-X2)+(CenterY-Y2)*(CenterY-Y2)),
	R >= sqrt(D1*D1 + (1/4)*D2*D2 - D1*D2*((D2*D2+D1*D1-D3*D3)/(2*D2*D1))).

% does circle intersect rectangle
intersects(
	circle(point2d(CenterX, CenterY), R),
	rectangle(point2d(LeftX2, LeftY2), point2d(RightX2, RightY2))) :-
	(CenterY+R) >= RightY2,
	(CenterY-R) =< LeftY2,
	(CenterX-R) =< RightX2,
	(CenterX+R) >= LeftX2.

% does circle intersect circle
intersects(
	circle(point2d(CenterX1, CenterY1), R1),
	circle(point2d(CenterX2, CenterY2), R2)) :-
	(CenterY1+R1) >= (CenterY2-R2),
	(CenterY1-R1) =< (CenterY2+R2),
	(CenterX1-R1) =< (CenterX2+R2),
	(CenterX1+R1) >= (CenterX2-R2).

% does segment with two points intersect square
intersects(
	segment(point2d(X,Y), point2d(X2, Y2)),
	square(point2d(LeftX2, LeftY2), L2)) :-
	Y >= (LeftY2-L2),
	Y2 =< LeftY2,
	X =< (LeftX2+L2),
	X2 >= LeftX2.

% does segment with two points intersect segment with two points
intersects(
	segment(point2d(X,Y), point2d(X2, Y2)),
	segment(point2d(X3,Y3), point2d(X4, Y4))) :-
	Y >= Y4,
	Y2 =< Y3,
	X =< X4,
	X2 >= X3.

% does segment with two points intersect segment with one point
intersects(
	segment(point2d(X,Y), point2d(X2, Y2)),
	segment(point2d(X3,Y3), S, L)) :-
	Y >= (Y3+(L*S)/(sqrt(1+(S*S)))),
	Y2 =< Y3,
	X =< (X3+(L)/(sqrt(1+(S*S)))),
	X2 >= X3.

% does segment with two points intersect rectangle
intersects(
	segment(point2d(X,Y), point2d(X2, Y2)),
	rectangle(point2d(LeftX2, LeftY2), point2d(RightX2, RightY2))) :-
	Y >= RightY2,
	Y2 =< LeftY2,
	X =< RightX2,
	X2 >= LeftX2.

% does segment with two points intersect circle
intersects(
	segment(point2d(X,Y), point2d(X2, Y2)),
	circle(point2d(CenterX, CenterY), R)) :-
	Y >= (CenterY-R),
	Y2 =< (CenterY+R),
	X =< (CenterX+R),
	X2 >= (CenterX-R),
	D1 is sqrt((CenterX-X)*(CenterX-X)+(CenterY-Y)*(CenterY-Y)),
	D2 is sqrt((X2-X)*(X2-X)+(Y2-Y)*(Y2-Y)),
	D3 is sqrt((CenterX-X2)*(CenterX-X2)+(CenterY-Y2)*(CenterY-Y2)),
	R >= sqrt(D1*D1 + (1/4)*D2*D2 - D1*D2*((D2*D2+D1*D1-D3*D3)/(2*D2*D1))).

% does segment with one point intersect square
intersects(
	segment(point2d(X,Y), S, L),
	square(point2d(LeftX2, LeftY2), L2)) :-
	Y >= (LeftY2-L2),
	(Y+(L*S)/(sqrt(1+(S*S)))) =< LeftY2,
	X =< (LeftX2+L2),
	(X+(L)/(sqrt(1+(S*S)))) >= LeftX2.

% does segment with one point intersect segment with two points
intersects(
	segment(point2d(X,Y), S, L),
	segment(point2d(X3,Y3), point2d(X4, Y4))) :-
	Y >= Y4,
	(Y+(L*S)/(sqrt(1+(S*S)))) =< Y3,
	X =< X4,
	(X+(L)/(sqrt(1+(S*S)))) >= X3.

% does segment with one point intersect segment with one point
intersects(
	segment(point2d(X,Y), S, L),
	segment(point2d(X3,Y3), S2, L2)) :-
	Y >= (Y4+(L2*S2)/(sqrt(1+(S2*S2)))),
	(Y+(L*S)/(sqrt(1+(S*S)))) =< Y3,
	X =< (X4+(L2)/(sqrt(1+(S2*S2)))),
	(X+(L)/(sqrt(1+(S*S)))) >= X3.

% does segment with one point intersect rectangle
intersects(
	segment(point2d(X,Y), S, L),
	rectangle(point2d(LeftX2, LeftY2), point2d(RightX2, RightY2))) :-
	Y >= RightY2,
	(Y+(L*S)/(sqrt(1+(S*S)))) =< LeftY2,
	X =< RightX2,
	(X+(L)/(sqrt(1+(S*S)))) >= LeftX2.

% does segment with one point intersect circle
intersects(
	segment(point2d(X,Y), S, L),
	circle(point2d(CenterX, CenterY), R)) :-
	Y >= (CenterY-R),
	(Y+(L*S)/(sqrt(1+(S*S)))) =< (CenterY+R),
	X =< (CenterX+R),
	(X+(L)/(sqrt(1+(S*S)))) >= (CenterX-R),
	X2 is (X+(L)/(sqrt(1+(S*S)))),
	Y2 is (Y+(L*S)/(sqrt(1+(S*S)))),
	D1 is sqrt((CenterX-X)*(CenterX-X)+(CenterY-Y)*(CenterY-Y)),
	D2 is sqrt((X2-X)*(X2-X)+(Y2-Y)*(Y2-Y)),
	D3 is sqrt((CenterX-X2)*(CenterX-X2)+(CenterY-Y2)*(CenterY-Y2)),
	R >= sqrt(D1*D1 + (1/4)*D2*D2 - D1*D2*((D2*D2+D1*D1-D3*D3)/(2*D2*D1))).


% is this point on the segment using two points
on(
	point2d(X,Y),
	segment(point2d(X2,Y2), point2d(X3,Y3))) :-
	0 =:= (((X-X2)*(Y3-Y2))-((Y-Y2)*(X3-X2))).

% is this point on the segment using one point a slope and a length
on(
	point2d(X,Y),
	segment(point2d(X2,Y2), S, L)) :-
	X3 is (X2+(L)/(sqrt(1+(S*S)))),
	Y3 is (Y2+(L*S)/(sqrt(1+(S*S)))),
	0 =:= (((X-X2)*(Y3-Y2))-((Y-Y2)*(X3-X2))).

% is this point on the square
on(
	point2d(X,Y),
	square(point2d(LeftX2, LeftY2), L2)) :-
	X1 is LeftX2,
	Y1 is LeftY2,
	X2 is LeftX2 + L2,
	Y2 is LeftY2,
	X3 is LeftX2,
	Y3 is LeftY2 - L2,
	X4 is LeftX2 + L2,
	Y4 is LeftY2 - L2,
	0 =:= ((X-X1)*(Y2-Y1))-((Y-Y1)*(X2-X1));
	X1 is LeftX2,
	Y1 is LeftY2,
	X2 is LeftX2 + L2,
	Y2 is LeftY2,
	X3 is LeftX2,
	Y3 is LeftY2 - L2,
	X4 is LeftX2 + L2,
	Y4 is LeftY2 - L2,
	0 =:= ((X-X1)*(Y3-Y1))-((Y-Y1)*(X3-X1));
	X1 is LeftX2,
	Y1 is LeftY2,
	X2 is LeftX2 + L2,
	Y2 is LeftY2,
	X3 is LeftX2,
	Y3 is LeftY2 - L2,
	X4 is LeftX2 + L2,
	Y4 is LeftY2 - L2,
	0 =:= ((X-X3)*(Y4-Y3))-((Y-Y3)*(X4-X3));
	X1 is LeftX2,
	Y1 is LeftY2,
	X2 is LeftX2 + L2,
	Y2 is LeftY2,
	X3 is LeftX2,
	Y3 is LeftY2 - L2,
	X4 is LeftX2 + L2,
	Y4 is LeftY2 - L2,
	0 =:= ((X-X2)*(Y4-Y2))-((Y-Y2)*(X4-X2)).

% is this point on the rectangle
on(
	point2d(X,Y),
	rectangle(point2d(LeftX2, LeftY2), point2d(RightX2, RightY2))) :-
	X1 is LeftX2,
	Y1 is LeftY2,
	X2 is RightX2,
	Y2 is LeftY2,
	X3 is LeftX2,
	Y3 is RightY2,
	X4 is RightX2,
	Y4 is RightY2,
	0 =:= ((X-X1)*(Y2-Y1))-((Y-Y1)*(X2-X1));
	X1 is LeftX2,
	Y1 is LeftY2,
	X2 is RightX2,
	Y2 is LeftY2,
	X3 is LeftX2,
	Y3 is RightY2,
	X4 is RightX2,
	Y4 is RightY2,
	0 =:= ((X-X1)*(Y3-Y1))-((Y-Y1)*(X3-X1));
	X1 is LeftX2,
	Y1 is LeftY2,
	X2 is RightX2,
	Y2 is LeftY2,
	X3 is LeftX2,
	Y3 is RightY2,
	X4 is RightX2,
	Y4 is RightY2,
	0 =:= ((X-X3)*(Y4-Y3))-((Y-Y3)*(X4-X3));
	X1 is LeftX2,
	Y1 is LeftY2,
	X2 is RightX2,
	Y2 is LeftY2,
	X3 is LeftX2,
	Y3 is RightY2,
	X4 is RightX2,
	Y4 is RightY2,
	0 =:= ((X-X2)*(Y4-Y2))-((Y-Y2)*(X4-X2)).

% is this point on the circle
on(
	point2d(X,Y),
	circle(point2d(CenterX, CenterY), R)) :-
	Distance is sqrt(((X-CenterX)*(X-CenterX))+((Y-CenterY)*(Y-CenterY))),
	Distance =:= R.

% is this point in the square
in(
	point2d(X,Y),
	square(point2d(LeftX2, LeftY2), L2)) :-
	X1 is LeftX2,
	Y1 is LeftY2,
	X2 is LeftX2 + L2,
	Y3 is LeftY2 - L2,
	X >= X1,
	Y =< Y1,
	X =< X2,
	Y >= Y3.

% is this point in the rectangle
in(
	point2d(X,Y),
	rectangle(point2d(LeftX2, LeftY2), point2d(RightX2, RightY2))) :-
	X1 is LeftX2,
	Y1 is LeftY2,
	X2 is RightX2,
	Y2 is LeftY2,
	X3 is LeftX2,
	Y3 is RightY2,
	X4 is RightX2,
	Y4 is RightY2,
	X >= X1,
	Y =< Y1,
	X =< X2,
	Y >= Y3.

% is this point in the circle
in(
	point2d(X,Y),
	circle(point2d(CenterX, CenterY), R)) :-
	Distance is sqrt(((X-CenterX)*(X-CenterX))+((Y-CenterY)*(Y-CenterY))),
	Distance =< R.
