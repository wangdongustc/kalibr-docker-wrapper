#!/bin/bash

function run_in_docker() {
    docker run --rm -v "/:/host" -w "/host/$(pwd)" kalibr:latest "$@"
}

# ros 

function rosbag() {
    run_in_docker rosbag "$@"
}

# tested, working

function kalibr_bagcreater() {
    run_in_docker kalibr_bagcreater "$@"
}

function kalibr_bagextractor() {
    run_in_docker kalibr_bagextractor "$@"
}

function kalibr_calibrate_cameras() {
    run_in_docker kalibr_calibrate_cameras --dont-show-report "$@"
}

function kalibr_calibrate_imu_camera() {
    run_in_docker kalibr_calibrate_imu_camera --dont-show-report "$@"
}

function kalibr_create_target_pdf() {
    run_in_docker kalibr_create_target_pdf "$@"
}

# not tested, expected to work

function kalibr_okvis_config() {
    run_in_docker kalibr_okvis_config "$@"
}

function kalibr_msf_config() {
    run_in_docker kalibr_msf_config "$@"
}

function kalibr_rovio_config() {
    run_in_docker kalibr_rovio_config "$@"
}

function kalibr_maplab_config() {
    run_in_docker kalibr_maplab_config "$@"
}

# tested, not working

function kalibr_calibrate_rs_cameras() {
    run_in_docker kalibr_calibrate_rs_cameras "$@"
}

# not tested, expected not to work

function kalibr_visualize_calibration() {
    run_in_docker kalibr_visualize_calibration "$@"
}

function kalibr_visualize_distortion() {
    run_in_docker kalibr_visualize_distortion "$@"
}
