SYSOPCTL(1)                    User Commands                   SYSOPCTL(1)

NAME
       sysopctl - A system management tool for Linux

SYNOPSIS
       sysopctl [COMMAND] [OPTIONS]

DESCRIPTION
       The sysopctl command manages system services, processes, and system resources.

COMMANDS
       service list
              List all active services.

       service start <service-name>
              Start the specified service.

       service stop <service-name>
              Stop the specified service.

       system load
              Display the system load averages.

       disk usage
              Display disk usage statistics.

       process monitor
              Monitor real-time system processes.

       logs analyze
              Analyze recent critical system logs.

       backup <path>
              Backup files at the specified path.

OPTIONS
       --help
              Display this help message.

       --version
              Display the command version.
