# SRE

SRE and Software engineer should be a same role. 

Read Goggle's famous book about SRE.

This repo made me interested in SRE:

- https://github.com/netdata/go.d.plugin

I think this is about data managing for monitoring.

SRE's are involved with analysis on logs and monitorings. 

## Basic stacks

| objectives | tools |
| SLO Monitoring | New Relic, Datadog, Grafana, Dynatrace, AppDynamics |
| Incident response and management | Slack, Zenduty |
| Automation and Orchestration  |Terraform, Cloudformation, Pulumi |
| Observability and Tracing  |Opentelementary, Zipkin, Jaegar |
| Reliability Engineering |Chaos Toolkit, Chaos Monkey, Litmus |

## RCA skills

RCA stands for **Root Cause Analysis** which aims to find the root causes for each inscident. 

There are some ways that you can improve your RCA's skills: 
- Understand pas inscidents
- Trace the workflow: By tracing the workflow, these are the knowledge that we want to obtain:
    - The dependencies between components
    - Finding critical components
- Familirize your self with traces and logs: By familiarizing it means the stuff below:
    - What metrics & traces are collected for each component in the system. 
    - What is the normal range for each metric ? 
    - What are log entries ? 
- Study data stores
- learn from known root causes: Start analyzing by known root causes. 

## Resources 

- https://www.zenduty.com/blog/site-reliability-engineering-sre-explained/
- https://www.zenduty.com/blog/root-cause-analysis-guide-sre/#:~:text=Site%20Reliability%20Engineers%20(SREs)%20play,(RCA)%20when%20issues%20arise

