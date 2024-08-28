# Base image
FROM python:3.10-slim

# Install necessary system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    axel \
    wget \
    && update-ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

RUN python3 -m pip install --no-cache-dir --upgrade pip wheel setuptools

# Copy only requirements first to leverage Docker cache
COPY src/requirements.txt ./src/requirements.txt

# Install JupyterLab and PyTorch with CUDA support
RUN python3 -m pip install --no-cache-dir jupyterlab \
    && python3 -m pip install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# Install Python dependencies
RUN python3 -m pip install --no-cache-dir -r src/requirements.txt

# Copy the rest of the application code
COPY . .

# # Grant execute permissions & execute to the data download script
# Download the file list using wget and then download the files using axel
# RUN wget -r -np -nd --spider https://physionet.org/files/ptb-xl/1.0.2/records100/ 2>&1 | grep '^--' | awk '{ print $3 }' > file_list.txt && \
#     xargs -n 1 -P 4 axel -n 10 < file_list.txt
# # Incase one doesnt want to run in a devcontainer
# EXPOSE 8888

# # Default command to run the application
# CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
