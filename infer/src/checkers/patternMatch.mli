(*
* Copyright (c) 2013 - Facebook. All rights reserved.
*)

(** Module for Pattern matching. *)

(** Returns the signature of a field access (class name, field name, field type name) *)
val get_java_field_access_signature : Sil.instr -> (string * string * string) option

(** Returns the formal signature (class name, method name,
argument type names and return type name) *)
val get_java_method_call_formal_signature :
Sil.instr -> (string * string * string list * string) option

(** Get the this type of a procedure *)
val get_this_type : Cfg.Procdesc.t -> Sil.typ option

(** Get the name of a type *)
val get_type_name : Sil.typ -> string

(** Get the type names of a variable argument *)
val get_vararg_type_names : Cfg.Node.t -> Sil.pvar -> string list

val has_formal_method_argument_type_names : Cfg.Procdesc.t -> Procname.t -> string list -> bool

(** Check if the method is one of the known initializer methods. *)
val method_is_initializer : Sil.tenv -> Procname.t -> Cfg.Procdesc.t -> bool

(** Is this a getter proc name? *)
val is_getter : Procname.t -> bool

(** Is this a setter proc name? *)
val is_setter : Procname.t -> bool

(** Is the type a direct subtype of *)
val is_direct_subtype_of : Sil.typ -> string -> bool

(** Get the name of the type of a constant *)
val java_get_const_type_name : Sil.const -> string

(** Get the values of a vararg parameter given the pvar used to assign the elements. *)
val java_get_vararg_values : Cfg.Node.t -> Sil.pvar -> Idenv.t -> Cfg.Procdesc.t -> Sil.exp list

val java_proc_name_with_class_method : Procname.t -> string -> string -> bool

(** [proc_calls get_proc_desc pn pd filter] returns the callees that satisfy [filter]. *)
val proc_calls : (Procname.t -> Cfg.Procdesc.t option) -> Procname.t -> Cfg.Procdesc.t ->
(Procname.t -> Cfg.Procdesc.t -> bool) ->
(Procname.t * Cfg.Procdesc.t) list

val type_get_annotation : Sil.typ -> Sil.item_annotation option

(** Get the class name of the type *)
val type_get_class_name : Sil.typ -> Mangled.t option

val type_get_direct_supertypes : Sil.typ -> Mangled.t list

val type_get_supertypes : Sil.tenv -> Sil.typ -> Sil.csu option -> Mangled.t list

(** Is the type a class with the given name *)
val type_has_class_name : Sil.typ -> Mangled.t -> bool

val type_has_direct_supertype : Sil.typ -> Mangled.t -> bool

val type_has_supertype : Sil.tenv -> Sil.typ -> Sil.csu option -> Mangled.t -> bool

(** Is the type a class type *)
val type_is_class : Sil.typ -> bool

val type_is_nested_in_direct_supertype : Sil.typ -> Mangled.t -> bool

val type_is_nested_in_supertype : Sil.tenv -> Sil.typ -> Sil.csu option -> Mangled.t -> bool

val type_is_nested_in_type : Sil.typ -> Mangled.t -> bool

(** Is the type java.lang.Object *)
val type_is_object : Sil.typ -> bool
