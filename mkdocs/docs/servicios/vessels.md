# Buques

![vessel](images/cargo-ship.jpg){: .shadow}

Tracking de buques para ello, se utilizan los datos AIS, es un transmisor que debe de enviar la posición de los buques en tiempo real. Existe un servicio llamada AISHub el cual provee datos de buques de todo el mundo.

## Flujo de datos

1. El servicio AIS, realiza una petición a [AIS Hub](http://www.aishub.net/){: target="_blank"} para descargar los datos del último minuto. Se ha optado por descargar los datos en formato CSV, ya que pesan menos.
2. Una vez descargados, se descomprimen y se inyectan al canal de datos brutos de buques de Kafka.
3. El microservicio *command* de vessel, escucha este canal de datos brutos, los procesa, comprueba que el buque esté añadido, en caso contrario lo añade, lo enriquece y por último lo envía al canal de guardar buques de Kafka.
4. *View* escucha el canal de guardar buques, almacena el dato en la base de datos.
5. Si el dato se ha guardado correctamente o no, se envía el estado en que acabo la operación, a través de Kafka.
6. *Command* recibe el estado de la operación de guardado, si ha habido algún problema se realizan acciones de compensación y alerta del error. En caso de éxito, el dato ya estaría guardado y listo para ser consultado.


![AIS](images/AIS.png){: .center}

## Add vessel

### Example
```
    $ curl 'https://redmic.es/api/vessels/commands' -i -X POST \
        -H 'Content-Type: application/json' \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json' \
        -d '{
      "id" : "vessel-mmsi-5555",
      "mmsi" : 5555,
      "imo" : 1234,
      "type" : {
        "id" : "vesseltype-code-70",
        "code" : "70",
        "name" : "Cargo, all ships of this type",
        "name_en" : "Cargo, all ships of this type"
      },
      "name" : "Avatar",
      "callSign" : "23e2",
      "length" : 230.5,
      "beam" : 30.2,
      "inserted" : "2018-10-02T10:46:54.668+00:00",
      "updated" : "2018-10-02T10:46:54.668+00:00"
    }'
```
### HTTP request
```
    POST /api/vessels/commands HTTP/1.1
    Content-Type: application/json
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es
    Content-Length: 404

    {
      "id" : "vessel-mmsi-5555",
      "mmsi" : 5555,
      "imo" : 1234,
      "type" : {
        "id" : "vesseltype-code-70",
        "code" : "70",
        "name" : "Cargo, all ships of this type",
        "name_en" : "Cargo, all ships of this type"
      },
      "name" : "Avatar",
      "callSign" : "23e2",
      "length" : 230.5,
      "beam" : 30.2,
      "inserted" : "2018-10-02T10:46:54.668+00:00",
      "updated" : "2018-10-02T10:46:54.668+00:00"
    }
```
### HTTP response
```
    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 471

    {
      "success" : true,
      "body" : {
        "id" : "vessel-mmsi-5555",
        "mmsi" : 5555,
        "imo" : 1234,
        "type" : {
          "id" : "vesseltype-code-70",
          "code" : "70",
          "name" : "Cargo, all ships of this type",
          "name_en" : "Cargo, all ships of this type"
        },
        "name" : "Avatar",
        "callSign" : "23e2",
        "length" : 230.5,
        "beam" : 30.2,
        "inserted" : "2018-10-02T10:46:55.578+00:00",
        "updated" : "2018-10-02T10:46:55.578+00:00"
      }
    }
```

## Update vessel


### Example
```
    $ curl 'https://redmic.es/api/vessels/commands/vessel-mmsi-5555' -i -X PUT \
        -H 'Content-Type: application/json' \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json' \
        -d '{
      "id" : "vessel-mmsi-5555",
      "mmsi" : 5555,
      "imo" : 1234,
      "type" : {
        "id" : "vesseltype-code-70",
        "code" : "70",
        "name" : "Cargo, all ships of this type",
        "name_en" : "Cargo, all ships of this type"
      },
      "name" : "Avatar",
      "callSign" : "23e2",
      "length" : 230.5,
      "beam" : 30.2,
      "inserted" : "2018-10-02T10:47:00.664+00:00",
      "updated" : "2018-10-02T10:47:00.664+00:00"
    }'
```

### HTTP request
------------

    PUT /api/vessels/commands/vessel-mmsi-5555 HTTP/1.1
    Content-Type: application/json
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es
    Content-Length: 404

    {
      "id" : "vessel-mmsi-5555",
      "mmsi" : 5555,
      "imo" : 1234,
      "type" : {
        "id" : "vesseltype-code-70",
        "code" : "70",
        "name" : "Cargo, all ships of this type",
        "name_en" : "Cargo, all ships of this type"
      },
      "name" : "Avatar",
      "callSign" : "23e2",
      "length" : 230.5,
      "beam" : 30.2,
      "inserted" : "2018-10-02T10:47:00.664+00:00",
      "updated" : "2018-10-02T10:47:00.664+00:00"
    }

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 471

    {
      "success" : true,
      "body" : {
        "id" : "vessel-mmsi-5555",
        "mmsi" : 5555,
        "imo" : 1234,
        "type" : {
          "id" : "vesseltype-code-70",
          "code" : "70",
          "name" : "Cargo, all ships of this type",
          "name_en" : "Cargo, all ships of this type"
        },
        "name" : "Avatar",
        "callSign" : "23e2",
        "length" : 230.5,
        "beam" : 30.2,
        "inserted" : "2018-10-02T10:47:00.664+00:00",
        "updated" : "2018-10-02T10:47:01.527+00:00"
      }
    }

## Delete vessel

Example
-------

    $ curl 'https://redmic.es/api/vessels/commands/vessel-mmsi-5555' -i -X DELETE \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json'

HTTP request
------------

    DELETE /api/vessels/commands/vessel-mmsi-5555 HTTP/1.1
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 22

    {
      "success" : true
    }

# Get vessel edit schema

Example
-------

    $ curl 'https://redmic.es/api/vessels/commands/_schema' -i -X GET \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json'

HTTP request
------------

    GET /api/vessels/commands/_schema HTTP/1.1
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 970

    {
      "$schema" : "http://json-schema.org/draft-04/schema#",
      "title" : "Vessel DTO",
      "type" : "object",
      "definitions" : { },
      "properties" : {
        "id" : {
          "type" : [ "string", "null" ]
        },
        "mmsi" : {
          "type" : [ "integer", "null" ],
          "maximum" : 999999999
        },
        "imo" : {
          "type" : [ "integer", "null" ],
          "maximum" : 9999999
        },
        "type" : {
          "type" : "integer",
          "url" : "/api/vessels/commands/vesseltype"
        },
        "name" : {
          "type" : "string",
          "minLength" : 1,
          "maxLength" : 500
        },
        "callSign" : {
          "type" : [ "string", "null" ]
        },
        "length" : {
          "type" : [ "number", "null" ]
        },
        "beam" : {
          "type" : [ "number", "null" ]
        },
        "inserted" : {
          "type" : [ "string", "null" ],
          "format" : "date-time"
        },
        "updated" : {
          "type" : [ "string", "null" ],
          "format" : "date-time"
        }
      },
      "required" : [ "type", "name" ]
    }

Add vessel type
===============

Example
-------

    $ curl 'https://redmic.es/api/vessels/commands/vesseltype' -i -X POST \
        -H 'Content-Type: application/json' \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json' \
        -d '{
      "id" : "vesseltype-code-70",
      "code" : "70",
      "name" : "Cargo, all ships of this type",
      "name_en" : "Cargo, all ships of this type"
    }'

HTTP request
------------

    POST /api/vessels/commands/vesseltype HTTP/1.1
    Content-Type: application/json
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es
    Content-Length: 141

    {
      "id" : "vesseltype-code-70",
      "code" : "70",
      "name" : "Cargo, all ships of this type",
      "name_en" : "Cargo, all ships of this type"
    }

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 186

    {
      "success" : true,
      "body" : {
        "id" : "vesseltype-code-70",
        "code" : "70",
        "name" : "Cargo, all ships of this type",
        "name_en" : "Cargo, all ships of this type"
      }
    }

Update vessel type
==================

Example
-------

    $ curl 'https://redmic.es/api/vessels/commands/vesseltype/vesseltype-code-70' -i -X PUT \
        -H 'Content-Type: application/json' \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json' \
        -d '{
      "id" : "vesseltype-code-70",
      "code" : "70",
      "name" : "Cargo, all ships of this type",
      "name_en" : "Cargo, all ships of this type"
    }'

HTTP request
------------

    PUT /api/vessels/commands/vesseltype/vesseltype-code-70 HTTP/1.1
    Content-Type: application/json
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es
    Content-Length: 141

    {
      "id" : "vesseltype-code-70",
      "code" : "70",
      "name" : "Cargo, all ships of this type",
      "name_en" : "Cargo, all ships of this type"
    }

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 186

    {
      "success" : true,
      "body" : {
        "id" : "vesseltype-code-70",
        "code" : "70",
        "name" : "Cargo, all ships of this type",
        "name_en" : "Cargo, all ships of this type"
      }
    }

Delete vessel type
==================

Example
-------

    $ curl 'https://redmic.es/api/vessels/commands/vesseltype/vesseltype-code-70' -i -X DELETE \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json'

HTTP request
------------

    DELETE /api/vessels/commands/vesseltype/vesseltype-code-70 HTTP/1.1
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 22

    {
      "success" : true
    }

Get vessel type edit schema
===========================

Example
-------

    $ curl 'https://redmic.es/api/vessels/commands/vesseltype/_schema' -i -X GET \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json'

HTTP request
------------

    GET /api/vessels/commands/vesseltype/_schema HTTP/1.1
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 520

    {
      "$schema" : "http://json-schema.org/draft-04/schema#",
      "title" : "Vessel Type DTO",
      "type" : "object",
      "properties" : {
        "id" : {
          "type" : [ "string", "null" ]
        },
        "code" : {
          "type" : "string",
          "minLength" : 1,
          "maxLength" : 10
        },
        "name" : {
          "type" : "string",
          "minLength" : 1,
          "maxLength" : 500
        },
        "name_en" : {
          "type" : "string",
          "minLength" : 1,
          "maxLength" : 500
        }
      },
      "required" : [ "code", "name", "name_en" ]
    }

Add vessel tracking
===================

Example
-------

    $ curl 'https://redmic.es/api/vessels/commands/activities/999/vesseltracking' -i -X POST \
        -H 'Content-Type: application/json' \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json' \
        -d '{
      "id" : "vesseltracking-mmsi-tstamp-4444-1538642806904",
      "uuid" : "2cc89c8e-809d-4e7e-be7f-22a4cbd15064",
      "type" : "Feature",
      "properties" : {
        "inserted" : null,
        "updated" : null,
        "activity" : "999",
        "vessel" : {
          "id" : "vessel-mmsi-4444",
          "mmsi" : 4444,
          "imo" : 1234,
          "type" : {
            "id" : "vesseltype-code-70",
            "code" : "70",
            "name" : "Cargo, all ships of this type",
            "name_en" : "Cargo, all ships of this type"
          },
          "name" : "Avatar",
          "callSign" : "23e2",
          "length" : 230.5,
          "beam" : 30.2,
          "inserted" : "2018-10-04T08:46:46.904+00:00",
          "updated" : "2018-10-04T08:46:46.904+00:00"
        },
        "date" : "2018-10-04T08:46:46.904+00:00",
        "cog" : 23.3,
        "sog" : 23.3,
        "heading" : 12,
        "navStat" : 33,
        "dest" : "Santa Cruz de Tenerife",
        "eta" : "00:00 00:00"
      },
      "geometry" : {
        "type" : "Point",
        "coordinates" : [ 44.56433, 37.94388 ]
      }
    }'

HTTP request
------------

    POST /api/vessels/commands/activities/999/vesseltracking HTTP/1.1
    Content-Type: application/json
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es
    Content-Length: 985

    {
      "id" : "vesseltracking-mmsi-tstamp-4444-1538642806904",
      "uuid" : "2cc89c8e-809d-4e7e-be7f-22a4cbd15064",
      "type" : "Feature",
      "properties" : {
        "inserted" : null,
        "updated" : null,
        "activity" : "999",
        "vessel" : {
          "id" : "vessel-mmsi-4444",
          "mmsi" : 4444,
          "imo" : 1234,
          "type" : {
            "id" : "vesseltype-code-70",
            "code" : "70",
            "name" : "Cargo, all ships of this type",
            "name_en" : "Cargo, all ships of this type"
          },
          "name" : "Avatar",
          "callSign" : "23e2",
          "length" : 230.5,
          "beam" : 30.2,
          "inserted" : "2018-10-04T08:46:46.904+00:00",
          "updated" : "2018-10-04T08:46:46.904+00:00"
        },
        "date" : "2018-10-04T08:46:46.904+00:00",
        "cog" : 23.3,
        "sog" : 23.3,
        "heading" : 12,
        "navStat" : 33,
        "dest" : "Santa Cruz de Tenerife",
        "eta" : "00:00 00:00"
      },
      "geometry" : {
        "type" : "Point",
        "coordinates" : [ 44.56433, 37.94388 ]
      }
    }

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 1148

    {
      "success" : true,
      "body" : {
        "id" : "vesseltracking-mmsi-tstamp-4444-1538642806904",
        "uuid" : "2cc89c8e-809d-4e7e-be7f-22a4cbd15064",
        "type" : "Feature",
        "properties" : {
          "inserted" : "2018-10-04T08:46:47.916+00:00",
          "updated" : "2018-10-04T08:46:47.916+00:00",
          "activity" : "999",
          "vessel" : {
            "id" : "vessel-mmsi-4444",
            "mmsi" : 4444,
            "imo" : 1234,
            "type" : {
              "id" : "vesseltype-code-70",
              "code" : "70",
              "name" : "Cargo, all ships of this type",
              "name_en" : "Cargo, all ships of this type"
            },
            "name" : "Avatar",
            "callSign" : "23e2",
            "length" : 230.5,
            "beam" : 30.2,
            "inserted" : "2018-10-04T08:46:46.904+00:00",
            "updated" : "2018-10-04T08:46:46.904+00:00"
          },
          "date" : "2018-10-04T08:46:46.904+00:00",
          "cog" : 23.3,
          "sog" : 23.3,
          "heading" : 12,
          "navStat" : 33,
          "dest" : "Santa Cruz de Tenerife",
          "eta" : "00:00 00:00"
        },
        "geometry" : {
          "type" : "Point",
          "coordinates" : [ 44.56433, 37.94388 ]
        }
      }
    }

Update vessel tracking
======================

Example
-------

    $ curl 'https://redmic.es/api/vessels/commands/activities/999/vesseltracking/vesseltracking-mmsi-tstamp-4444-1538642804320' -i -X PUT \
        -H 'Content-Type: application/json' \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json' \
        -d '{
      "id" : "vesseltracking-mmsi-tstamp-4444-1538642804320",
      "uuid" : "6ee57375-6d7d-4423-b72d-b8ed6d6cdbbe",
      "type" : "Feature",
      "properties" : {
        "inserted" : null,
        "updated" : null,
        "activity" : "999",
        "vessel" : {
          "id" : "vessel-mmsi-4444",
          "mmsi" : 4444,
          "imo" : 1234,
          "type" : {
            "id" : "vesseltype-code-70",
            "code" : "70",
            "name" : "Cargo, all ships of this type",
            "name_en" : "Cargo, all ships of this type"
          },
          "name" : "Avatar",
          "callSign" : "23e2",
          "length" : 230.5,
          "beam" : 30.2,
          "inserted" : "2018-10-04T08:46:44.320+00:00",
          "updated" : "2018-10-04T08:46:44.320+00:00"
        },
        "date" : "2018-10-04T08:46:44.320+00:00",
        "cog" : 23.3,
        "sog" : 23.3,
        "heading" : 12,
        "navStat" : 33,
        "dest" : "Santa Cruz de Tenerife",
        "eta" : "00:00 00:00"
      },
      "geometry" : {
        "type" : "Point",
        "coordinates" : [ 44.56433, 37.94388 ]
      }
    }'

HTTP request
------------

    PUT /api/vessels/commands/activities/999/vesseltracking/vesseltracking-mmsi-tstamp-4444-1538642804320 HTTP/1.1
    Content-Type: application/json
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es
    Content-Length: 985

    {
      "id" : "vesseltracking-mmsi-tstamp-4444-1538642804320",
      "uuid" : "6ee57375-6d7d-4423-b72d-b8ed6d6cdbbe",
      "type" : "Feature",
      "properties" : {
        "inserted" : null,
        "updated" : null,
        "activity" : "999",
        "vessel" : {
          "id" : "vessel-mmsi-4444",
          "mmsi" : 4444,
          "imo" : 1234,
          "type" : {
            "id" : "vesseltype-code-70",
            "code" : "70",
            "name" : "Cargo, all ships of this type",
            "name_en" : "Cargo, all ships of this type"
          },
          "name" : "Avatar",
          "callSign" : "23e2",
          "length" : 230.5,
          "beam" : 30.2,
          "inserted" : "2018-10-04T08:46:44.320+00:00",
          "updated" : "2018-10-04T08:46:44.320+00:00"
        },
        "date" : "2018-10-04T08:46:44.320+00:00",
        "cog" : 23.3,
        "sog" : 23.3,
        "heading" : 12,
        "navStat" : 33,
        "dest" : "Santa Cruz de Tenerife",
        "eta" : "00:00 00:00"
      },
      "geometry" : {
        "type" : "Point",
        "coordinates" : [ 44.56433, 37.94388 ]
      }
    }

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 1121

    {
      "success" : true,
      "body" : {
        "id" : "vesseltracking-mmsi-tstamp-4444-1538642804320",
        "uuid" : "6ee57375-6d7d-4423-b72d-b8ed6d6cdbbe",
        "type" : "Feature",
        "properties" : {
          "inserted" : null,
          "updated" : "2018-10-04T08:46:45.459+00:00",
          "activity" : "999",
          "vessel" : {
            "id" : "vessel-mmsi-4444",
            "mmsi" : 4444,
            "imo" : 1234,
            "type" : {
              "id" : "vesseltype-code-70",
              "code" : "70",
              "name" : "Cargo, all ships of this type",
              "name_en" : "Cargo, all ships of this type"
            },
            "name" : "Avatar",
            "callSign" : "23e2",
            "length" : 230.5,
            "beam" : 30.2,
            "inserted" : "2018-10-04T08:46:44.320+00:00",
            "updated" : "2018-10-04T08:46:44.320+00:00"
          },
          "date" : "2018-10-04T08:46:44.320+00:00",
          "cog" : 23.3,
          "sog" : 23.3,
          "heading" : 12,
          "navStat" : 33,
          "dest" : "Santa Cruz de Tenerife",
          "eta" : "00:00 00:00"
        },
        "geometry" : {
          "type" : "Point",
          "coordinates" : [ 44.56433, 37.94388 ]
        }
      }
    }

Delete vessel tracking
======================

Example
-------

    $ curl 'https://redmic.es/api/vessels/commands/activities/999/vesseltracking/vesseltracking-mmsi-tstamp-4444-1538642799750' -i -X DELETE \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json'

HTTP request
------------

    DELETE /api/vessels/commands/activities/999/vesseltracking/vesseltracking-mmsi-tstamp-4444-1538642799750 HTTP/1.1
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 22

    {
      "success" : true
    }

Get vessel tracking edit schema
===============================

Example
-------

    $ curl 'https://redmic.es/api/vessels/commands/activities/999/vesseltracking/_schema' -i -X GET \
        -H 'Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0' \
        -H 'Accept: application/json'

HTTP request
------------

    GET /api/vessels/commands/activities/999/vesseltracking/_schema HTTP/1.1
    Authorization: Bearer 5db69015-565d-4fb8-b3a5-340dce84ddc0
    Accept: application/json
    Host: redmic.es

HTTP response
-------------

    HTTP/1.1 200 OK
    Content-Type: application/json;charset=UTF-8
    X-Content-Type-Options: nosniff
    X-XSS-Protection: 1; mode=block
    Cache-Control: no-cache, no-store, max-age=0, must-revalidate
    Pragma: no-cache
    Expires: 0
    Strict-Transport-Security: max-age=31536000 ; includeSubDomains
    X-Frame-Options: DENY
    Content-Length: 1705

    {
      "$schema" : "http://json-schema.org/draft-04/schema#",
      "title" : "Vessel Tracking DTO",
      "type" : "object",
      "definitions" : {
        "VesselTrackingPropertiesDTO" : {
          "type" : "object",
          "properties" : {
            "vessel" : {
              "type" : "integer",
              "url" : "none"
            },
            "date" : {
              "type" : "string",
              "format" : "date-time"
            },
            "cog" : {
              "type" : [ "number", "null" ]
            },
            "sog" : {
              "type" : [ "number", "null" ]
            },
            "heading" : {
              "type" : [ "integer", "null" ]
            },
            "navStat" : {
              "type" : [ "integer", "null" ]
            },
            "dest" : {
              "type" : [ "string", "null" ]
            },
            "eta" : {
              "type" : [ "string", "null" ]
            }
          },
          "required" : [ "vessel", "date" ]
        }
      },
      "properties" : {
        "id" : {
          "type" : [ "string", "null" ]
        },
        "uuid" : {
          "type" : [ "string", "null" ]
        },
        "properties" : {
          "$ref" : "#/definitions/VesselTrackingPropertiesDTO"
        },
        "geometry" : {
          "type" : "object",
          "additionalProperties" : false,
          "properties" : {
            "type" : {
              "type" : "string",
              "enum" : [ "Point" ],
              "default" : "Point"
            },
            "coordinates" : {
              "type" : "array",
              "items" : {
                "type" : "number",
                "maximum" : 9000000000000000,
                "minimum" : -9000000000000000
              },
              "minItems" : 2,
              "maxItems" : 2
            }
          },
          "required" : [ "type", "coordinates" ]
        }
      },
      "required" : [ "properties", "geometry" ]
    }
