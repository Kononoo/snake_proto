
.PHONY: snakehead rpc voiceroom music unitygame snakeapi system

all: snakehead rpc voiceroom music unitygame snakeapi system

snakehead:
	protoc --go_out=. --go_opt=paths=source_relative ./snakehead/*.proto
 		--go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative ./snakehead/*.proto
rpc:
	protoc --proto_path=. --go_out=. --go_opt=paths=source_relative \
 		--go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative ./rpc/*.proto

voiceroom:
	protoc  --proto_path=. --go_out=. --go_opt=paths=source_relative \
        --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative ./voiceroom/*.proto

music:
	protoc --proto_path=. --go_out=. --go_opt=paths=source_relative \
       --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative ./music/*.proto

unitygame:
	protoc --go_out=. --go_opt=paths=source_relative\
			--go-grpc_out=. --go-grpc_opt=require_unimplemented_servers=false,paths=source_relative ./unitygame/*.proto

snakeapi:
	protoc  --proto_path=.  --go_out=. --go_opt=paths=source_relative \
	   --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative ./snakeapi/*.proto
	protoc  --proto_path=. --proto_path=/  --go_out=. --go_opt=paths=source_relative \
	   --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative  ./snakeapi/*/*.proto ./snakeapi/*/*.Proto

system:
	protoc  --proto_path=.  --go_out=. --go_opt=paths=source_relative \
	   --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative ./system/*.proto
	protoc  --proto_path=. --proto_path=/  --go_out=. --go_opt=paths=source_relative \
	   --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative  ./system/*/*.proto ./system/*/*.Proto