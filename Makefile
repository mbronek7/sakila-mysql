.PHONY: run create open close remove

run:
	docker run -d --name sakila-mysql-container -p 3306:3306 -v sakila-mysql-data:/var/lib/mysql sakila-mysql

create:
	@if [ "$$(docker images -q sakila-mysql)" = "" ]; then \
		echo "Building image..."; \
		docker build -t sakila-mysql .; \
	fi

open:
	docker exec -it sakila-mysql-container mysql -u sakila -pp_ssW0rd sakila

close:
	docker stop sakila-mysql-container

remove:
	docker rm sakila-mysql-container
