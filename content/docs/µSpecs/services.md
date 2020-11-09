---
title: "Services"
---

# Anatomy of a service µSpec


{{< hint danger >}}
The field **methods** in µServcies will translate to **services** in the standard notation for compatibility reasons, 
because the standard notation is some years old and changing this would be a breaking change we do not want to do at the moment.
{{< /hint >}}

```yaml
- name: FruitService
  description: |
    Fruits are healthy, so having a service which can list some fruits would be nice.
    We do not cover all fruits, but some. The list will grow with time, hopefully.
  package: fruit
  target: fruit_service.proto
  methods:
    - md: 'ListFruits: GET /fruits google.protobuf.Empty , fruit.FruitCollection #Filterable and searchable list of fruits with pagination.'
      qp:
        q: 'string #Use this to search for a fruit.'
        filter: 'string #Use this field to filter the fruits, this is not searching.'
        order_by: 'string #Use this field to specify the ordering.'
        page: 'string #Use this field to specify page to display.'
```
