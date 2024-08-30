FROM python:3.9.19-bullseye

RUN apt-get -q update \ 
  && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
    wget

  # git \
  # python3.9 \
  # python3-pip \
  # && python3.9 -m pip install -q -U --no-cache-dir pip \
  # && rm -rf /var/lib/apt/lists/* \
  # && apt-get autoremove -y \
  # && apt-get clean \
  # && pip install -q --no-cache-dir \
  # dgl==1.0.2+cu116 -f https://data.dgl.ai/wheels/cu116/repo.html \
  # torch==1.12.1+cu116 --extra-index-url https://download.pytorch.org/whl/cu116 \
  # e3nn==0.3.3 \
  # wandb==0.12.0 \
  # pynvml==11.0.0 \
  # git+https://github.com/NVIDIA/dllogger#egg=dllogger \
  # decorator==5.1.0 \
  # hydra-core==1.3.2 \
  # pyrsistent==0.19.3

RUN wget -qnc https://files.ipd.uw.edu/krypton/ananas && mv ananas /usr/local/bin/ananas && chmod +x /usr/local/bin/ananas

RUN pip3 -q install git+https://github.com/sokrypton/ColabDesign.git@v1.1.1
RUN ln -s /usr/local/lib/python3.*/dist-packages/colabdesign colabdesign

COPY . /workspace
WORKDIR /workspace

RUN python3 preprocess_diffusion.py