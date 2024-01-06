# Job

Job is a background process can be applied on problems that are not time sensitive taht much. 

Features may use job:
- Two factor authentication
- Penalyzing and compensating users

## Resume job

Some jobs may be log processing and they should not be always running. 

For such jobs we need to store the check point that the job has processed until there. 

## Tools for job

For jobs there are two tools:
- [rabbitmq](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Brokers/Rabbit.md#job-schedule)
- [k8s cronjob](https://github.com/parsaeisa/Notes/blob/main/DevOps/kubernetes.md#job)