cd /shallow
rm -rf *.git
rm -rf copies/*
cat IU.repos | xargs --max-lines=1 git clone --bare --depth 20
for i in `ls -d *.git/`; do cd $i && git tag | xargs git tag -d && cd ..; done
for i in `ls -d *.git/`; do cd $i && git filter-branch -- --all && cd ..; done
for i in `ls -d *.git/`; do cd copies && git clone --bare ../${i%/} && cd ..; done
rm -rf /opt/git/*
mv copies/* /opt/git/
