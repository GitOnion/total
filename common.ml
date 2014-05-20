(** Definitions in common use *)

type name = string

(** Variable names *)
(*              the name      a proposed name for the pprinter *)
type variable = name option * name option

let none = None, None
let none_with x = None, Some x
let some x = Some x, None 

let get_name = fst
let get_proposed = snd


(** Position in source code. For each type in the abstract syntax we define two versions
    [t] and [t']. The former is the latter with a position tag. For example, [expr = expr'
    * position] and [expr'] is the type of expressions (without positions). 
*)
type position =
  | Position of Lexing.position * Lexing.position (** delimited position *)
  | Nowhere (** unknown position *)

(** [nowhere e] is the expression [e] without a source position. It is used when
    an expression is generated and there is not reasonable position that could be
    assigned to it. *)
let nowhere x = (x, Nowhere)
