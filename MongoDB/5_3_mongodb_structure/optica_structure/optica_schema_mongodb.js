db.createCollection("glasses", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["brand", "frame_type", "frame_colour", "price", "supplier"],
      properties: {
        brand: {
          bsonType: "string",
        },
        prescription_left_eye: {
          bsonType: "double",
        },
        prescription_right_eye: {
          bsonType: "double",
        },
        frame_type: {
          enum: ["floating", "paste", "metallic"],
        },
        frame_colour: {
          bsonType: "string",
        },
        left_glass_colour: {
          bsonType: "string",
        },
        right_glass_colour: {
          bsonType: "string",
        },
        price: {
          bsonType: "double",
        },
        supplier: {
          bsonType: "array",
          items: {
            bsonType: "object",
            required: [
              "supplier_name",
              "zip_code",
              "country",
              "phone_number",
              "tax_id",
            ],
            properties: {
              supplier_name: {
                bsonType: "string",
              },
              street: {
                bsonType: "string",
              },
              street_number: {
                bsonType: "string",
              },
              floor: {
                bsonType: "string",
              },
              door: {
                bsonType: "string",
              },
              city: {
                bsonType: "string",
              },
              zip_code: {
                bsonType: "number",
              },
              country: {
                bsonType: "string",
              },
              phone_number: {
                bsonType: "number",
              },
              fax_number: {
                bsonType: "number",
              },
              tax_id: {
                bsonType: "string",
              },
            },
          },
        },
      },
    },
  },
});

db.createCollection("clients", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["client_name", "address", "email", "register_date"],
      properties: {
        client_name: {
          bsonType: "string",
        },
        address: {
          bsonType: "string",
        },
        phone_number: {
          bsonType: "number",
        },
        email: {
          bsonType: "string",
        },
        register_date: {
          bsonType: "date",
        },
        sales: {
          bsonType: "array",
          items: {
            bsonType: "object",
            required: ["sales_id", "employee", "glasses", "date"],
            properties: {
              sales_id: {
                bsonType: "objectId",
              },
              employee: {
                bsonType: "objectId",
              },
              glasses: {
                bsonType: "objectId",
              },
              date: {
                bsonType: "date",
              },
            },
          },
        },
      },
    },
  },
});

db.createCollection("employee", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["first_name", "last_name", "employee_id"],
      properties: {
        first_name: {
          bsonType: "string",
        },
        last_name: {
          bsonType: "string",
        },
        employee_id: {
          bsonType: "string",
        },
      },
    },
  },
});
