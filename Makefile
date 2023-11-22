
.PHONY: rpc voiceroom music

all: rpc voiceroom music

rpc:
	protoc --proto_path=. --go_out=. --go_opt=paths=source_relative \
 		--go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative ./rpc/*.proto

voiceroom:
	protoc  --proto_path=. --go_out=. --go_opt=paths=source_relative \
        --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative ./voiceroom/*.proto

music:
	protoc --proto_path=. --go_out=. --go_opt=paths=source_relative \
       --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative ./music/*.proto

snakeapi:
	protoc  --proto_path=.  --go_out=. --go_opt=paths=source_relative ./snakeapi/base.proto