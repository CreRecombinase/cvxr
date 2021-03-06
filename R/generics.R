# DCP attribute generic methods
setGeneric("is_zero", function(object) { standardGeneric("is_zero") })
setGeneric("is_positive", function(object) { standardGeneric("is_positive") })
setGeneric("is_negative", function(object) { standardGeneric("is_negative") })
setGeneric("is_unknown", function(object) { standardGeneric("is_unknown") })

setGeneric("is_constant", function(object) { standardGeneric("is_constant") })
setGeneric("is_affine", function(object) { standardGeneric("is_affine") })
setGeneric("is_convex", function(object) { standardGeneric("is_convex") })
setGeneric("is_concave", function(object) { standardGeneric("is_concave") })
setGeneric("is_quadratic", function(object) { standardGeneric("is_quadratic") })
setGeneric("is_dcp", function(object) { standardGeneric("is_dcp") })
setGeneric("size", function(object) { standardGeneric("size") })

# Expression generic methods
setGeneric("value", function(object) { standardGeneric("value") })
setGeneric("value<-", function(object, value) { standardGeneric("value<-") })
setGeneric("save_value", function(object, value) { standardGeneric("save_value") })
setGeneric("get_data", function(object) { standardGeneric("get_data") })
setGeneric("curvature", function(object) { standardGeneric("curvature") })
setGeneric("is_scalar", function(object) { standardGeneric("is_scalar") })
setGeneric("is_vector", function(object) { standardGeneric("is_vector") })
setGeneric("is_matrix", function(object) { standardGeneric("is_matrix") })

setGeneric("name", function(object) { standardGeneric("name") })
setGeneric("variables", function(object) { standardGeneric("variables") })
setGeneric("parameters", function(object) { standardGeneric("parameters") })
setGeneric("constants", function(object) { standardGeneric("constants") })
setGeneric("grad", function(object) { standardGeneric("grad") })
setGeneric("domain", function(object) { standardGeneric("domain") })
setGeneric("validate_val", function(object, val) { standardGeneric("validate_val") })
setGeneric("canonical_form", function(object) { standardGeneric("canonical_form") })
setGeneric("canonicalize", function(object) { standardGeneric("canonicalize") })

setGeneric(".grad", function(object, values) { standardGeneric(".grad") })
setGeneric(".domain", function(object) { standardGeneric(".domain") })

# Positive definite inequalities
setGeneric("%>>%", function(e1, e2) { standardGeneric("%>>%") })
setGeneric("%<<%", function(e1, e2) { standardGeneric("%<<%") })

# Atom generic methods
setGeneric("validate_args", function(object) { standardGeneric("validate_args") })
setGeneric("size_from_args", function(object) { standardGeneric("size_from_args") })
setGeneric("sign_from_args", function(object) { standardGeneric("sign_from_args") })
setGeneric("get_data", function(object) { standardGeneric("get_data") })
setGeneric("to_numeric", function(object, values) { standardGeneric("to_numeric") })

setGeneric("is_atom_convex", function(object) { standardGeneric("is_atom_convex") })
setGeneric("is_atom_concave", function(object) { standardGeneric("is_atom_concave") })
setGeneric("is_incr", function(object, idx) { standardGeneric("is_incr") })
setGeneric("is_decr", function(object, idx) { standardGeneric("is_decr") })
setGeneric("graph_implementation", function(object, arg_objs, size, data) { standardGeneric("graph_implementation") })

# Constraint generic methods
setGeneric("id", function(object) { standardGeneric("id") })
setGeneric("residual", function(object) { standardGeneric("residual") })
setGeneric("violation", function(object) { standardGeneric("violation") })
setGeneric("num_cones", function(object) { standardGeneric("num_cones") })
setGeneric("cone_size", function(object) { standardGeneric("cone_size") })
setGeneric("dual_value", function(object) { standardGeneric("dual_value") })
setGeneric("format_constr", function(object, eq_constr, leq_constr, dims, solver) { standardGeneric("format_constr") })
setGeneric("constr_type", function(object) { standardGeneric("constr_type") })

# Problem generic methods
setGeneric("status", function(object) { standardGeneric("status") })
setGeneric("size_metrics", function(object) { standardGeneric("size_metrics") })
setGeneric("solver_stats", function(object) { standardGeneric("solver_stats") })
setGeneric("get_problem_data", function(object, solver) { standardGeneric("get_problem_data") })

# Problem data generic methods
setGeneric("get_objective", function(object) { standardGeneric("get_objective") })
setGeneric("get_eq_constr", function(object) { standardGeneric("get_eq_constr") })
setGeneric("get_ineq_constr", function(object) { standardGeneric("get_ineq_constr") })
setGeneric("get_nonlin_constr", function(object) { standardGeneric("get_nonlin_constr") })

# Solver generic methods
setGeneric("validate_solver", function(solver, constraints) { standardGeneric("validate_solver") })
setGeneric("validate_cache", function(solver, objective, constraints, cached_data) { standardGeneric("validate_cache") })
setGeneric("get_sym_data", function(solver, objective, constraints, cached_data) { standardGeneric("get_sym_data") })
setGeneric("get_matrix_data", function(solver, objective, constraints, cached_data) { standardGeneric("get_matrix_data") })
setGeneric("Solver.get_problem_data", function(solver, objective, constraints, cached_data) { standardGeneric("Solver.get_problem_data") })

setGeneric("matrix_intf", function(solver) { standardGeneric("matrix_intf") })
setGeneric("vec_intf", function(solver) { standardGeneric("vec_intf") })
setGeneric("split_constr", function(solver, constr_map) { standardGeneric("split_constr") })
setGeneric("cvxr_solve_int", function(solver, objective, constraints, cached_data, warm_start, verbose, solver_opts) { standardGeneric("cvxr_solve_int") })
setGeneric("format_results", function(solver, results_dict, data, cached_data) { standardGeneric("format_results") })

# Solver capabilities
setGeneric("lp_capable", function(solver) { standardGeneric("lp_capable") })
setGeneric("socp_capable", function(solver) { standardGeneric("socp_capable") })
setGeneric("sdp_capable", function(solver) { standardGeneric("sdp_capable") })
setGeneric("exp_capable", function(solver) { standardGeneric("exp_capable") })
setGeneric("mip_capable", function(solver) { standardGeneric("mip_capable") })
setGeneric("status_map", function(solver, status) { standardGeneric("status_map") })
