# Get the IP address of the host from /etc/resolv.conf
export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
export LIBGL_ALWAYS_INDIRECT=1
# # Set the display path
export DISPLAY=$WSL_HOST:0.0
