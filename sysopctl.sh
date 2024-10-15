#!/bin/bash

# Command Name: sysopctl
# Command Version: v0.1.0

VERSION="v0.1.0"

function show_help() {
    echo "Usage: sysopctl [COMMAND] [OPTIONS]"
    echo ""
    echo "Commands:"
    echo "  service list                   List all active services"
    echo "  service start <service-name>    Start a system service"
    echo "  service stop <service-name>     Stop a system service"
    echo "  system load                    View current system load"
    echo "  disk usage                     Check disk usage statistics"
    echo "  process monitor                Monitor system processes"
    echo "  logs analyze                   Analyze recent system logs"
    echo "  backup <path>                  Backup files at the specified path"
    echo "  --help                         Show help information"
    echo "  --version                      Show version information"
}

function show_version() {
    echo "sysopctl version $VERSION"
}

function list_services() {
    systemctl list-units --type=service
}

function start_service() {
    sudo systemctl start "$1"
    echo "Service $1 started."
}

function stop_service() {
    sudo systemctl stop "$1"
    echo "Service $1 stopped."
}

function system_load() {
    uptime
}

function disk_usage() {
    df -h
}

function process_monitor() {
    top
}

function logs_analyze() {
    journalctl -p crit -n 10
}

function backup_files() {
    rsync -av --progress "$1" /backup/  # Assumes /backup/ is the destination
    echo "Backup of $1 completed."
}

# Parse the command-line arguments
case "$1" in
    --help)
        show_help
        ;;
    --version)
        show_version
        ;;
    service)
        case "$2" in
            list)
                list_services
                ;;
            start)
                start_service "$3"
                ;;
            stop)
                stop_service "$3"
                ;;
            *)
                echo "Unknown service command."
                show_help
                ;;
        esac
        ;;
    system)
        if [ "$2" = "load" ]; then
            system_load
        else
            echo "Unknown system command."
            show_help
        fi
        ;;
    disk)
        if [ "$2" = "usage" ]; then
            disk_usage
        else
            echo "Unknown disk command."
            show_help
        fi
        ;;
    process)
        if [ "$2" = "monitor" ]; then
            process_monitor
        else
            echo "Unknown process command."
            show_help
        fi
        ;;
    logs)
        if [ "$2" = "analyze" ]; then
            logs_analyze
        else
            echo "Unknown logs command."
            show_help
        fi
        ;;
    backup)
        backup_files "$2"
        ;;
    *)
        echo "Unknown command."
        show_help
        ;;
esac
