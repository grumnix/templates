{
  outputs = { self }: {
    templates = rec {
      default = {
        path = ./default;
      };
    };
  };
}
