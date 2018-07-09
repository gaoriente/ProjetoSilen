DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `cpf` varchar(30) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `endereco` varchar(80) NOT NULL,
  `endereco_numero` varchar(10) NOT NULL,
  `endereco_complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(40) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_cliente`;

CREATE TABLE `tb_cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(200) DEFAULT '',
  `CPFCNPJ` varchar(30) DEFAULT '',
  `sexoCliente` varchar(45) DEFAULT '',
  `telCelular` varchar(45) DEFAULT '',
  `telFixo` varchar(45) DEFAULT '',
  `telRecado` varchar(45) DEFAULT '',
  `email` varchar(200) DEFAULT '',
  `enderecoCliente` varchar(100) DEFAULT '',
  `numeroCliente` int(11) DEFAULT NULL,
  `complementoCliente` varchar(45) DEFAULT '',
  `bairroCliente` varchar(45) DEFAULT '',
  `cidadeCliente` varchar(45) DEFAULT '',
  `estadoCliente` varchar(45) DEFAULT '',
  `cepCliente` varchar(45) DEFAULT '',
  `idTipoContrato` int(11) DEFAULT NULL,
  `ativo` bit(1) DEFAULT NULL,
  `usuarioCriacao` int(11) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `usuarioModificacao` int(11) DEFAULT NULL,
  `dataModificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_destinatario`;

CREATE TABLE `tb_destinatario` (
  `idDestinatario` int(11) NOT NULL AUTO_INCREMENT,
  `nomeDestinatario` varchar(100) NOT NULL,
  `enderecoDestinatario` varchar(100) NOT NULL,
  `numeroDestinatario` int(11) NOT NULL,
  `complementoDestinatario` varchar(100) NOT NULL,
  `bairroDestinatario` varchar(100) NOT NULL,
  `cidadeDestinatario` varchar(100) NOT NULL,
  `estadoDestinatario` varchar(45) NOT NULL,
  `ativo` bit(1) NOT NULL,
  `usuarioCriacao` int(11) NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `usuarioModificacao` int(11) NOT NULL,
  `dataModificacao` datetime NOT NULL,
  PRIMARY KEY (`idDestinatario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_entrega`;

CREATE TABLE `tb_entrega` (
  `idEntrega` int(11) NOT NULL AUTO_INCREMENT,
  `idRemetente` int(11) DEFAULT NULL,
  `idDestinatario` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `idEntregador` int(11) DEFAULT NULL,
  `contato` varchar(45) DEFAULT '',
  `telefone` varchar(45) DEFAULT '',
  `idStatus` int(11) DEFAULT NULL,
  `idTipo` int(11) DEFAULT NULL,
  `dataEnvio` datetime DEFAULT NULL,
  `dataRetirada` datetime DEFAULT NULL,
  `ativo` bit(1) DEFAULT NULL,
  `usuarioCriacao` int(11) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `usuarioModificacao` int(11) DEFAULT NULL,
  `dataModificacao` datetime DEFAULT NULL,
  PRIMARY KEY (`idEntrega`),
  UNIQUE KEY `idEntrega_UNIQUE` (`idEntrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_remetente`;

CREATE TABLE `tb_remetente` (
  `idRemetente` int(11) NOT NULL AUTO_INCREMENT,
  `nomeRemetente` varchar(100) NOT NULL,
  `enderecoRemetente` varchar(100) NOT NULL,
  `numeroRemetente` int(11) NOT NULL,
  `complementoRemetente` varchar(100) NOT NULL,
  `bairroRemetente` varchar(100) NOT NULL,
  `cidadeRemetente` varchar(100) NOT NULL,
  `estadoRemetente` varchar(45) NOT NULL,
  `ativo` bit(1) NOT NULL,
  `usuarioCriacao` int(11) NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `usuarioModificacao` int(11) NOT NULL,
  `dataModificacao` datetime NOT NULL,
  PRIMARY KEY (`idRemetente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_statusentrega`;

CREATE TABLE `tb_statusentrega` (
  `idStatusentrega` int(11) NOT NULL AUTO_INCREMENT,
  `statusentrega` varchar(45) NOT NULL,
  `ativo` bit(1) NOT NULL,
  `usuarioCriacao` int(11) NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `usuarioModificacao` int(11) NOT NULL,
  `dataModificacao` datetime NOT NULL,
  PRIMARY KEY (`idStatusentrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_tipocontrato`;

CREATE TABLE `tb_tipocontrato` (
  `idTipoContrato` int(11) NOT NULL AUTO_INCREMENT,
  `tipocontrato` varchar(45) NOT NULL,
  `ativo` bit(1) NOT NULL,
  `usuarioCriacao` int(11) NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `usuarioModificacao` int(11) NOT NULL,
  `dataModificacao` datetime NOT NULL,
  PRIMARY KEY (`idTipoContrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_tipoentrega`;

CREATE TABLE `tb_tipoentrega` (
  `idTipoEntrega` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) NOT NULL,
  `ativo` bit(1) NOT NULL,
  `usuarioCriacao` int(11) NOT NULL,
  `dataCriacao` datetime NOT NULL,
  `usuarioModificacao` int(11) NOT NULL,
  `dataModificacao` datetime NOT NULL,
  PRIMARY KEY (`idTipoEntrega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `username` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(256) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;