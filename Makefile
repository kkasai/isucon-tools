build:
	docker compose build
alp:
	docker compose run --rm -it tools alp ltsv --reverse --file $(file) $(arg)
alpdiff:
	docker compose run --rm -it tools apl diff $(file1) $(file2) --reverse
pt:
	docker compose run --rm -it tools pt-query-digest $(file)
