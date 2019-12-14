use "SignatureBINTREE.sml";
structure Binarytree : BINTREE = struct
  datatype 'a bintree = 
          Empty
          | Node of 'a * 'a bintree * 'a bintree ;
  exception Empty_bintree;
  fun root Empty = raise Empty_bintree
          | root (Node (x, _, _)) = x;
  fun leftSubtree Empty = raise Empty_bintree
          | leftSubtree (Node (_, LST, _)) = LST;
  fun rightSubtree Empty = raise Empty_bintree
     | rightSubtree (Node (_, _, RST)) = RST;
  fun isLeaf Empty = false
    | isLeaf (Node (_, Empty, Empty)) = true
    | isLeaf _ = false;
  fun size Empty = 0
          | size (Node (_, left, right)) =
          let
                  val ls = size left
                  val rs = size right
          in 1 + ls + rs
          end;
  local fun pre (Empty, Llist) = (NONE)::Llist
          | pre (Node (N, LST, RST), Llist) =
                  let val Mlist = pre (RST, Llist)
                          val Nlist = pre (LST, Mlist)
                  in (SOME N)::Nlist
                  end
          in fun preorder T = pre (T, [])
  end;
  local fun post (Empty, Llist) = (NONE)::Llist
          | post (Node (N, LST, RST), Llist) =
                  let val Mlist = post (RST, (SOME N)::Llist)
                          val Nlist = post (LST, Mlist)
                  in  Nlist
                  end
          in fun postorder T = post (T, [])
  end;
  local fun ino (Empty, Llist, depth) = (NONE, depth)::Llist
          | ino (Node (N, LST, RST), Llist, depth) =
                  let val Mlist = ino (RST, Llist, (depth+1))
                          val Nlist = ino (LST, (SOME N, depth)::Mlist, (depth+1))
                  in  Nlist
                  end
          in fun inorder T = ino (T, [], 0)
  end;
  local
  fun convert2node (SOME x,y) = Node((SOME x ,y),Empty,Empty)
                  | convert2node (NONE, y) = Node((NONE,y),Empty,Empty);
  fun recover_it [] = []
          | recover_it [N] = [N]
          | recover_it [a,b] = [a,b]
          | recover_it [Node((v1,h1),l1,r1), Node((v2,h2),l2,r2), Node((v3,h3),l3,r3)] = 
          if h1=h3 andalso h2=h1-1 
          then [Node((v2,h2), Node((v1,h1),l1,r1), Node((v3,h3),l3,r3))]
          else [Node((v1,h1),l1,r1), Node((v2,h2),l2,r2), Node((v3,h3),l3,r3)]
          | recover_it (h1::h2::h3::t) = 
                  let 
                          val head = recover_it([h1,h2,h3])@t
                  in List.hd(head)::recover_it(List.tl(head))
                  end;
  fun recover_node [] = []
          | recover_node [X] = [X] 
          | recover_node L = 
          let val L_ = recover_it L
                  in recover_node L_
          end;
  fun convert (Empty) = Empty 
          | convert (Node((NONE,y), Empty, Empty)) = Empty
          | convert (Node((SOME x, y),Empty,Empty)) = Node(valOf(SOME x),Empty,Empty)
          | convert (Node((SOME x, y), left, right)) =
          let val leftval = convert (left);
                  val rightval = convert (right);
          in Node(valOf(SOME x),leftval,rightval)
          end;
  fun recover L = 
          let val node_list = map convert2node L
                  in List.hd(recover_node node_list)
          end;
  in 
    fun inorderInverse L = 
          let val T_ = recover L
                  in convert T_
          end;
  end;
end;
