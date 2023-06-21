// Main file

import "my_module" as my_mod;

fn process_request(request) {
  my_mod::process_request(request)
}

fn supergraph_service(service) {
  // Rhai convention for creating a function pointer
  const request_callback = Fn("process_request"); 
  
  service.map_request(request_callback);
}
