FROM codercom/code-server:latest

ENV PASSWORD=ChangeThisPassword

EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "/home/coder"]
