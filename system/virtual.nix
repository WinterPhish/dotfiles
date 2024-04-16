{ ... }:
{
  virtualisation.vmVariant =
    {
      # following configuration is added only when building VM with build-vm
      virtualisation = {
        memorySize = 5048; # Use 2048MiB memory.
        cores = 5;
      };
    };
  virtualisation.vmVariantWithBootLoader = {
    # following configuration is added only when building VM with build-vm
    virtualisation = {
      memorySize = 5048; # Use 2048MiB memory.
      cores = 5;
    };
  };
  boot.enableContainers = true;
}
