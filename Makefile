
.PHONY: snakecommon snakehead rpc voiceroom music unitygame snakeapi system activity wxsnake fallguys matchx unityctl

all: snakecommon snakehead rpc voiceroom music unitygame snakeapi system activity wxsnake fallguys matchx unityctl

snakecommon:
	protoc --go_out=. --go_opt=paths=source_relative ./snakecommon/*.proto
     		--go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative ./snakecommon/*.proto

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
	protoc  --proto_path=. --proto_path=/  --go_out=. --go_opt=paths=source_relative \
	   --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative  ./system/*/*.proto ./system/team_endless/unityserver/*.proto

activity:
	protoc  --proto_path=. --proto_path=/  --go_out=. --go_opt=paths=source_relative \
	   --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative  ./activity/*/*.proto

wxsnake:
	protoc --go_out=. --go_opt=paths=source_relative\
		--go-grpc_out=. --go-grpc_opt=require_unimplemented_servers=false,paths=source_relative ./wxsnake/*.proto

fallguys:
	protoc --go_out=. --go_opt=paths=source_relative\
		--go-grpc_out=. --go-grpc_opt=require_unimplemented_servers=false,paths=source_relative ./fallguys/*.proto

matchx:
	protoc  --proto_path=. --proto_path=/  --go_out=. --go_opt=paths=source_relative \
    	   --go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt=paths=source_relative  ./matchx/*/*.proto

unityctl:
	ls ./unityctl/*.proto | grep -v "struct.proto" | xargs protoc --go_out=. --go_opt=paths=source_relative\
 		--go-grpc_out=. --go-grpc_opt=require_unimplemented_servers=false,paths=source_relative