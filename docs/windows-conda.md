I don't really do anything python related in windows. This is how I set up my python environment within wsl.


```
cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
chmod a+x Anaconda3-2019.03-Linux-x86_64.sh
./Anaconda3-2019.03-Linux-x86_64.sh
```

At this point I pretty much keep everything vanilla.

**Environments**

Usually I'll start with a python 2.7, 3.7 and an ml environment. I'm not too fussed about keeping things neat, I'll use docker if I'm actually going to use something.


```
conda create -n py37 python=3.7
conda create -n py27 python=2.7
conda create -n ml python=3.7
```

Then during workflow

```
conda activate py37
```