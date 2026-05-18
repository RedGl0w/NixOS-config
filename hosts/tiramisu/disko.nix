{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/disk/by-id/ata-CT480BX500SSD1_2212E61F6C92";

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
          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };
        };
      };
    };
    
    disk.a = {
      type = "disk";
      device = "/dev/disk/by-id/ata-ST2000VN004-2E4164_Z52BMNCA";
      
      content = {
        type = "gpt";
        partitions = {
          zfs = {
            size = "100%";
            content = {
            	type = "zfs";
            	pool = "zroot";
            };
          };
        };
      };
    };
    
    disk.b = {
      type = "disk";
      device = "/dev/disk/by-id/ata-ST2000VN004-2E4164_Z52BWRL8";
      
      content = {
        type = "gpt";
        partitions = {
          zfs = {
            size = "100%";
            content = {
            	type = "zfs";
            	pool = "zroot";
            };
          };
        };
      };
    };
    
    disk.c = {
      type = "disk";
      device = "/dev/disk/by-id/ata-ST2000VN004-2E4164_Z52BWNKF";
      
      content = {
        type = "gpt";
        partitions = {
          zfs = {
            size = "100%";
            content = {
            	type = "zfs";
            	pool = "zroot";
            };
          };
        };
      };
    };

    zpool = {
      zroot = {
        type = "zpool";
        mode = "raidz1";

        datasets = {
          movies = {
            type = "zfs_fs";
            mountpoint = "/movies";
            options.mountpoint = "legacy";
          };
          nextcloud = {
            type = "zfs_fs";
            mountpoint = "/nextcloud";
            options.mountpoint = "legacy";
          };
        };
      };
    };
  };
}

