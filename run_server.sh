world_name=$1 

if [ -z $world_name ]; then
    echo "ワールドの名前を指定してください。" >&2
    exit 1
fi

docker run -d --name necesse -e WORLD_NAME=$world_name -p 14159:14159/udp -v ./data:/home/necesse/.config/Necesse --restart always necesse
