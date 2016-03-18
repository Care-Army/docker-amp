# Docker image for AMP
Docker image for [AMP by CubeCoders](http://cubecoders.com/AMP).

## Usage
```
docker create \
    --name amp \
    -e AMP_LICENSE="12345678-90-1234-5678-901234567890" \
    lochnair/amp
```

## Environment variables
| Name | Required | Default |
| ------------- | ------------- | ------------- |
| AMP_FLAGS  | No  | Empty |
| AMP_LICENSE | **Yes** | &lt;INSERT_KEY_HERE&gt; |
| AMP_MODULE | No | Minecraft |
| AMP_PASSWORD | No | Changeme123 |
| AMP_PORT | No | 8080 |

## Volumes
| Path |
| ------------- |
| /home/amp |
