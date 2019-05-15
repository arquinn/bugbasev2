# [ticket 1263](https://trac.nginx.org/nginx/ticket/1263)
- behavior: worker process segmentation fault
- description: subrequest with ssi on
- sketch:
  - src/http/modules/ngx_http_ssi_filter_module.c:1562

    ssi context is missing when ssi is called in subrequest, *i.e.* `ctx` ends up being a null pointer.

  - src/http/modules/ngx_http_ssi_filter_module.c:1588

    try to access a member of struct referenced by null pointer

- patch: N/A
