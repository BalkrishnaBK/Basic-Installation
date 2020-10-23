# Basic Intallation of softwares

This github repository will help you to deploy/Install basic applications with Kubernetes installations using shell scripting. I have mentioned below installation scripts

  - Kubernetes installation with version 1.11.3

## Contents

- [Kubernetes installation with version 1.11.3](#setup-and-configuration)
    - [Run k8smaster.sh](#making-edits--customizing-the-template)
    - [Run k8snode.shasd](#using-the-template-as-is)
- [ToDo's](#license)
- [License](#license)

## Kubernetes installation with version 1.11.3

You can clone my repository and run given files on your cluster i.e on Ubuntu machines for now.

### Run k8smaster.sh
To run the file you need to go to folder `Kubernetes with version 1.11.3` and run file like:

```sh 
sudo sh k8smaster.sh
```

OR

```sh
sudo chmod 777 k8smaster.sh
./k8smaster.sh
```
Now you will get joining token for master copy that token. And save it on notepad.



### Run k8snode.sh
To run the file you need to go to folder `Kubernetes with version 1.11.3`.
First paste token you have copied from last stage and paste it file.
```sh 
sudo kubeadm join ****
Chnage this command with 
sudo kubeadm join 'TOKEN'
```
Then run below commands
```sh 
sudo sh k8snode.sh
```

OR

```sh
sudo chmod 777 k8snode.sh
./k8snode.sh
```
Once you will run above script on machine youre kubernetes node will get added to master.



## ToDo's

 - Write more installation scripts


## License

Completely free (MIT)! See [LICENSE.md](LICENSE.md) for more.
