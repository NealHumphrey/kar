PROJECT=this-is-my-unique-project-name
AWS_PROFILE=mycompany

task-run() {
    docker run -v "$(pwd)" -e AWS_PROFILE=$AWS_PROFILE $@
}

task-logs() {
    awslogs get /aws/lambda/$PROJECT --no-group $@
}

task-lab() {
    docker run -v "$(pwd)" -e AWS_PROFILE=$AWS_PROFILE \
        python -m jupyter lab \
            --NotebookApp.token='' --ip=0.0.0.0 --port 8888 \
            --allow-root --no-browser 1>/dev/null $@
}
