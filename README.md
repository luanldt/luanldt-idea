# luanldt-idea
Docker file idea

```shell
docker run --rm \
  -e DISPLAY=${DISPLAY} \
  -v ~/.Idea:/home/dev/.Idea \
  -v ~/.Idea.java:/home/dev/.java \
  -v ~/.Idea.maven:/home/dev/.m2 \
  -v ~/.Idea.gradle:/home/dev/.gradle \
  -v ~/.Idea.share:/home/dev/.local/share/JetBrains \
  -v ~/Project:/home/dev/Project \
  --name idea-docker \
luanldt/idea:1.0
```
