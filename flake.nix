{
  description = "A collection of flake templates for coding projects";

  outputs = _: {
    templates = {
      c = {
        path = ./c;
        description = "Simple C project";
      };
      rust = {
        path = ./rust;
        description = "Simple Rust project";
      };
      arm-lkm = {
        path = ./arm-lkm;
        description = "LKM project for arm";
      };
      arm = {
        path = ./arm;
        description = "ARM project";
      };
      avr = {
        path = ./avr;
        description = "AVR project";
      };
      haskell = {
        path = ./haskell;
        description = "Haskell project";
      };
    };
  };
}
