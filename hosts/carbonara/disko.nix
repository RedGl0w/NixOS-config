{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/nvme0n1";

      content = {
        type = "gpt";

        partitions = {
          ESP = {
            size = "512M";
            type = "EF00";

            content = {
              type = "filesystem";
              format = "vfat";
              extraArgs = [ "-F" "32" ];
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };

          luks = {
            size = "100%";

            content = {
              type = "luks";
              name = "cryptroot";

              settings = {
                allowDiscards = true;
              };

              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}

