---
title: "Types"
---

# Anatomy of a type µSpec
The "type-object" contains of 3 fields. The fields `type`,  `fields` are mandatory, the field `target` is optional.

*File: muspec/sample.types.yaml*
```yaml
- type: 'sample.Sample #A sample type'
  fields:
    password: '* string:1 #The password.'
    username: '* string:2 #The username or email, or something to identify.'
    details: 'sample.Details:3 #Details.'
  target: sample.proto # this is "optional", if you omit this, the spectools will use the package name (auth)

- type: 'sample.Details #A sample type'
  fields:
    birth_date: '* google.type.Date:1 #The birth date.'
    weight: '* number:2 #The weight.'    
    age: '- number:3 #Calculated field for displaying the age, because the calculations are very hard.'
  target: sample.proto 

```

## The type line

```yaml
- type: 'sample.Sample (ce) #A sample type'
  !___!  !___________! !__! !____________!
    |          |         |       |
    |      type name     |       |
    |                    |       |
    |                    |   description (recomended) begins with a #
    |                    |
    |   indicator to create a collection and or a entity for the type (optional)
    | 
    | 
field name  

```
- **type name** is defined by package.Type
- **auto entity/collection** (ce) write a **c** to autogenerate the collection type and **e** to generate the entity type for this type.
- **description** It is a good practice to give a good description of the type. This description will go to the generated protos and other generates.