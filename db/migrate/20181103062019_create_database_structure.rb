class CreateDatabaseStructure < ActiveRecord::Migration[5.2]
  def change
	create_table "clientes", primary_key: "cli_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "cli_nombre", limit: 20, null: false
    t.string "cli_tel", limit: 30, null: false
    t.integer "zon_id", null: false
  end

  create_table "database_structures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  end

  create_table "empleados", primary_key: "emp_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "emp_nombre", limit: 200, null: false
    t.string "emp_telefono", limit: 200, null: false
  end

  create_table "insumos", primary_key: "ins_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ins_nombre", limit: 200, null: false
    t.string "ins_descripcion", limit: 200, null: false
  end

  create_table "pagos", primary_key: "pagos_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tar_id", null: false
    t.float "pagos_importe", limit: 53, null: false
    t.date "pagos_fecha"
    t.integer "cli_id", null: false
    t.integer "emp_id", null: false
  end

  create_table "tarea_insumos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tar_id", null: false
    t.integer "ins_id", null: false
    t.integer "cantidad"
  end

  create_table "tareas", primary_key: "tar_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "tar_descripcion", limit: 200, null: false
    t.integer "cli_id", null: false
    t.integer "emp_id", null: false
    t.float "tar_importe", limit: 53
  end

  create_table "usuarios", primary_key: "usu_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "usu_nombre", limit: 200, null: false
    t.string "usu_email", limit: 200, null: false
    t.string "usu_password", limit: 200, null: false
    t.integer "ran_id", null: false
  end

  create_table "zonas", primary_key: "zon_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "zon_nombre", limit: 200, null: false
  end
  end
end
