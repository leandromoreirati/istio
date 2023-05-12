# Istio

This project perform deployment of the `Istio`.

## How to Install

```bash
bash deploy.sh deploy-istio
```

## Notes

* By defautlt AWX is installed with the follwing default configuration

* 1 - Istio configuration folder: `$PWD/istio`

To change default values:

```bash
bash deploy.sh deploy-istio "<ISTIO_CONFIGURATION_FOLDER>"
```

## How to Uninstall

```bash
bash deploy.sh destroy-istio
```
