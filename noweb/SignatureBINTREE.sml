signature BINTREE = 
sig
        type 'a bintree
        exception Empty_bintree
        val Empty : 'a bintree
        val Node : 'a * 'a bintree * 'a bintree -> 'a bintree
        val root : 'a bintree -> 'a
        val leftSubtree : 'a bintree -> 'a bintree
        val rightSubtree : 'a bintree -> 'a bintree
        val isLeaf : 'a bintree -> bool
        val size : 'a bintree -> int
        val preorder : 'a bintree -> 'a option list
        val inorder : 'a bintree -> ('a option * int) list
        val postorder : 'a bintree -> 'a option list
        val inorderInverse : ('a option * int) list -> 'a bintree
end;
