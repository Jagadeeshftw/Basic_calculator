# Use the Alpine base image
FROM alpine

# Install necessary dependencies
RUN apk add --no-cache \
    chromium \
    udev \
    ttf-freefont

# Set up environment variables
ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# Set the working directory
WORKDIR /app

# Copy the HTML file to the working directory
COPY index.html .

# Define the command to run Google Chrome and open the HTML file
CMD ["chromium-browser", "--headless", "--disable-gpu", "--no-sandbox", "--remote-debugging-address=0.0.0.0", "--remote-debugging-port=9222", "index.html"]
