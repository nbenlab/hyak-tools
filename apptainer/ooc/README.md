# Ollama-OpenCode Container

The `ooc.sif` container (built by `ooc.def`) contains both Ollama and
OpenCode. If you want to use these, you need to start Ollama first:

```bash
apptainer instance start \
    --bind /gscratch/nbenlab/opt \
    --bind /gscratch/nbenlab/scratch \
    --bind ~/.opencode \
    ooc.sif ollama
```

Then run OpenCode:

```bash
apptainer run ooc.sif
```

To stop the ollama server:

```bash
apptainer instance stop ollama
```


## Building the Image

To build this image, use the following command **in a worker node (do
not run this on the login node)**:

```bash
apptainer build /gscratch/nbenlab/apptainer/ooc.sif ooc.def
```
