# EMLOv3 | Assignment 6

[![pytorch](https://img.shields.io/badge/PyTorch_1.13+-ee4c2c?logo=pytorch&logoColor=white)](https://pytorch.org/get-started/locally/)
[![lightning](https://img.shields.io/badge/-Lightning_2.0+-792ee5?logo=pytorchlightning&logoColor=white)](https://pytorchlightning.ai/)
[![hydra](https://img.shields.io/badge/Config-Hydra_1.3-89b8cd)](https://hydra.cc/)
[![black](https://img.shields.io/badge/Code%20Style-Black-black.svg?labelColor=gray)](https://black.readthedocs.io/en/stable/)


## ViT on CIFAR10 Data 
The module is called <em>'gold'</em>.
- It supports models available in TIMM for compatible datasets.
- VIT model for training, evaluation & inference on CIFAR10 dataset.
- Experiment tracking using MLFlow, AIM, Tensorboard & CSV logger.

All functionalities can be controlled by hydra configs.

## DVC Setup

1. To track the all relevant folders using DVC, run the following command:

```bash
dvc add data logs .aim
```

2. To add the relevant folders to remote storage, run the following command:

```bash
dvc remote add -d local ../dvc_storage
```

3. To push the relevant folders to remote storage, run the following command:

```bash
dvc push -r local
```

4. To pull the relevant folders from remote storage, run the following command:

```bash
dvc pull -r local
```

## Docker Training

1. To build / pull the docker image, run the following command:

```bash
docker build -t salilgtm/emlov3_assignment_6 .
```

OR 

```bash
docker pull salilgtm/emlov3_assignment_6:latest
```

dockerhub link: https://hub.docker.com/r/salilgtm/EMLO_session06_Experiment_tracking

2. To run the docker image for training, run the following command:

```bash
docker run -it --expose 5000 -p 5000:5000 -v ${pwd}:/workspace --name gold-container salilgtm/emlov3_assignment_6 adamantium_train -m hydra/launcher=joblib hydra.launcher.n_jobs=5 experiment=cifar10 model.patch_size=1,2,4,8,16 data.num_workers=0
```

3. To run the MLFlow UI, run the following command:

```bash
docker exec -it -w /workspace/logs/mlflow adamantium-container mlflow ui --host 0.0.0.0
```

## Results

### MLFlow Runs
![multirun](assets/mlflow-multirun.png)

### patch_size vs val/acc
![comparison](assets/comparison_scatterplot.png)

### Artifact Structure
![artifact](assets/artifact_structure.png)

### Logs Structure
![logs](assets/logs_structure.png)

## Past Documentation

- [Assignment 4](https://github.com/salil-gtm/emlov3_assignment_4)
- [Assignment 5](https://github.com/salil-gtm/emlov3_assignment_5)

## Author

- Salil Gautam