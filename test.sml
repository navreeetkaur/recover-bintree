use "Binarytree.sml";

open Binarytree;
(*Control.Print.printLength := 500;
Control.Print.linewidth := 80;
*)
(*Tree 1*)
local
	val t7 = Node (7, Empty, Empty);
	val t6 = Node (6, t7, Empty); 
	val t5 = Node (5, Empty, Empty); 
	val t4 = Node (4, Empty, Empty); 
	val t3 = Node (3, t5, t6);
	val t2 = Node (2, Empty, t4); 
in 
	val tree1 = Node (1, t2, t3);
	val I1 = inorder tree1;
	val P1 = preorder tree1;
	val T1 = inorderInverse I1;
end;

(*Tree 2*)
local
	val t8 = Node(8,Empty,Empty);
	val t9 = Node(9,Empty,Empty);
	val t10 = Node(10,Empty,Empty);
	val t11 = Node(11,Empty,Empty);
	val t12 = Node(12,Empty,Empty);
	val t13 = Node(13,Empty,Empty);
	val t14 = Node(14,Empty,Empty);
	val t15 = Node(15,Empty,Empty);
	val t4 = Node(4,t8,t9);
	val t5 = Node(5,t10,t11);
	val t6 = Node(6,t12,t13);
	val t7 = Node(7,t14,t15);
	val t2 = Node(2,t4,t5);
	val t3 = Node(3,t6,t7);
in 
	val tree2 = Node(1,t2,t3);
	val I2 = inorder tree2;
	val P2 = preorder tree2;
	val T2 = inorderInverse I2;
end;


(*Tree 3*)
local
	val t3 = Node(3,Empty,Empty);
	val t4 = Node(4,Empty,Empty);
	val t2 = Node(2,t3,t4);
in
	val tree3 = Node(1,t2,Empty);
	val I3 = inorder tree3;
	val P3 = preorder tree3;
	val T3 = inorderInverse I3;
end;

(*Tree 4*)
local
	val t3 = Node(3,Empty,Empty);
	val t4 = Node(4,Empty,Empty);
	val t2 = Node(2,t3,t4);
in
	val tree4 = Node(1,Empty,t2);
	val I4 = inorder tree4;
	val P4 = preorder tree4;
	val T4 = inorderInverse I4;
end;

(*Tree 5*)
local
	val t4 = Node(4,Empty,Empty);
	val t3 = Node(3,t4,Empty);
	val t2 = Node(2,t3,Empty);
in
	val tree5 = Node(1,t2,Empty);
	val I5 = inorder tree5;
	val P5 = preorder tree5;
	val T5 = inorderInverse I5;
end;


(*Tree 6*)
local
	val t4 = Node(4,Empty,Empty);
	val t3 = Node(3,Empty,t4);
	val t2 = Node(2,Empty,t3);
in
	val tree6 = Node(1,Empty,t2);
	val I6 = inorder tree6;
	val P6 = preorder tree6;
	val T7 = inorderInverse I6;
end;


(*Tree 7*)
local
	val t6 = Node(6,Empty,Empty);
	val t7 = Node(7,Empty,Empty);
	val t4 = Node(4,t6,Empty);
	val t5 = Node(5,Empty,t7);
	val t2 = Node(2,t4,Empty);
	val t3 = Node(3,Empty,t5);
in
	val tree7 = Node(1,t2,t3);
	val I7 = inorder tree7;
	val P7 = preorder tree7;
	val T7 = inorderInverse I7;
end;

(*Tree 8*)
local
	val t6 = Node(6,Empty,Empty);
	val t7 = Node(7,Empty,Empty);
	val t4 = Node(4,t6,Empty);
	val t5 = Node(5,Empty,t7);
	val t2 = Node(2,Empty,t4);
	val t3 = Node(3,t5,Empty);
in
	val tree8 = Node(1,t2,t3);
	val I8 = inorder tree8;
	val P8 = preorder tree8;
	val T8 = inorderInverse I8;
end;


