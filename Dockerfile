# Use the official Alpine image
FROM alpine:latest

# Install OpenSSH server
RUN apk update && apk add openssh

# Set root password (change 'rootpassword' to a strong password)
RUN echo 'root:bob' | chpasswd

# Allow root login via SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]
