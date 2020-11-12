---
title: "Types"
weight: 10
---

# Anatomy of a type spec
A type spec consists of 2 main sections (fields and __proto) and some properties on the root.

## name
This property is deprecated. Fill in the same as you fill in on the property `type` for compatibility with some old generators.

## type
The type of the field without the package name. Write it in CamelCase with a capital letter at the beginning.

## __proto
The proto section defines some properties to generate the proto files.

```yaml
__proto:
    package: auth
    targetfile: auth.proto
    imports: []
    options:
        go_package: github.com/veith/doit-specs/dist/pb/auth;authpb
        java_multiple_files: "true"
        java_outer_classname: AuthProto
        java_package: com.furo.baseauth
```
### Field `package` *string*
This is the desired proto package name. 

In proto this is optional, in specs this field is **not optional**

> You can add an optional package specifier to a .proto file to prevent name clashes between protocol message types.

[Learn more about packages in protobuf](https://developers.google.com/protocol-buffers/docs/proto3#packages)

### Field `targetfile` *string*
The name of the proto file. Multiple types can write to the same file, if they belong to the same package.
The file will be generated in a folder according to the package.

A package `company.groups` with a protofile `green.proto` and a config target `dist/proto` will be generated to 

`dist/proto/company/groups/green.proto`

### Field `imports` *[]string*
Add imports by hand only if you do not work with the spectools chain. Spectools will check and fix imports for you.

This can be done with the command `spectools checkImports`. Imports that can not be found would be reported.

Imports that are not needed anymore, are removed too.

```yaml
    imports:
        - google/type/date.proto
        - google/type/timeofday.proto
```

    ### field options *map<string.string>*
When needed, you can add options for your protos. This can be something like the following:

```yaml
    options:
        go_package: github.com/veith/doit-specs/dist/pb/auth;authpb
        java_multiple_files: "true"
        java_outer_classname: AuthProto
        java_package: com.furo.baseauth
```


{{< hint danger >}}
**Potential pitfall:**
The value of an option is a string, so write values which should have true as value like this:

`java_multiple_files: "true"`

When you write true not as string, the value will not work.
{{< /hint >}}



## Fields *map<string, Field>*
The most important part of a type spec are the fields. The fields section contains a map with fields. A field itself
has the properties `type`, `description`, `meta`, `constraints`, `__ui` and `__proto`.

```yaml
    password:
        type: string
        description: The password.
        __proto:
            number: 1
            oneof: ""
        __ui: null
        meta:
            default: ""
            hint: ""
            label: auth.Credentials.password.label
            options:
                flags: []
                list: []
            readonly: false
            repeated: false
            typespecific: null
        constraints:
            required:
                is: "true"
                message: password is required
```

### Field `type` *string*
The type of the field. This should be one of the types that you have defined or installed.

### Field `description` *string*
It is a good practice to give a good description of the type. This description will go to the generated protos and other generates.

### Field `meta` *Meta*
In the meta field you can set additional information for field in your type. Only the field *meta.repeated* does impact the proto. The options that you set here
are thought for the backend and the client. 
This properties are domain specific and can give instructions for *generators*, *validators* or *displaying* the field.

```yaml
 meta:
    default: "1234"
    hint: "look at the post-it on your monitor or below the keyboard"
    label: auth.Credentials.password.label
    options:
        flags: []
        list: []
    readonly: false
    repeated: false
    extensions: {}
```
#### `default` *string*
The default value for the field when you create a new object. Keep in mind that this is a string and should be parsed by your implementation.

#### `hint` *string*
This property gives you a hint message. On the furo client libs, this property goes through the translation engine first [optional]. The `furo-data-xxx-input` components will display 
this value below the field, when you focus it.

#### `label` *string*
This property labels the field. On the furo client libs, this property goes through the translation engine first [optional]. The `furo-data-xxx-input` components will display
this value as placeholder (as long the field is empty) and or label (as soon you have some value) 

#### `options.flags` *[]string*

#### `options.list`  *[]Anything*

#### `readonly` *bool*
Define the field as readonly. The furo client libs will not send this field on a request by default.

#### `repeated` *bool*
Define the field as repeated. Keep in mind that not all combinations are possible. 
As an exapmle, if you set *oneof* in __proto, repeated must be set to false. 

#### typespecific: *Anything*
This is a extension point for fields in types. The name will be changed to extensions and should be repeated.

### Field `constraints` *map<string, Constraint>*

```yaml
    constraints:
      required:
        is: "true"
        message: password is required
```

### Field `__proto:` *Fieldproto*


```yaml
    __proto:
        number: 1
        oneof: ""
```

### Field `__ui:` *Uiprops*
