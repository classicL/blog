
echo 'Deploy System'
echo '-----------------------'

# 源码目录-发布目录
deployFrom=$1;
deployTo='';

#检查项目是否存在
if [ ! -d $deployFrom ]; then 
    echo -e "project not found !\n";  
    exit 1;
fi

if [ ${deployFrom:0:1} == '_' ]; then 
    echo -e "["$deployFrom"] is not a project !\n";  
    exit 1;
fi

case $deployFrom in
    'aboutblog')
		deployTo='../../web/topic/aboutblog'
    ;;
    'aboutme')
        deployTo='../../web/topic/aboutme'
    ;;
    'aboutme_old')
        deployTo='../../web/topic/aboutme_old'
    ;;
    'intiate')
        deployTo='../../web/topic/intiate'
    ;;
    'multi-page')
        deployTo='../../web/'
    ;;
    *)  
		echo -e "need config first,please edit deploy.sh !\n";
    	exit 1; 
    ;;
esac

echo '  from '$deployFrom
echo '  to   '$deployTo

cd $deployFrom
fis3 release -d $deployTo --file fis-conf.js