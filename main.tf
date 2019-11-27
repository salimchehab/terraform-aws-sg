resource "aws_security_group" "this" {
  count = var.create_sg ? 1 : 0

  vpc_id      = var.vpc_id
  name        = var.sg_name
  description = var.sg_description

  tags = merge(
    {
      "Name" = var.sg_name,
    },
    var.sg_tags
  )
}

resource "aws_security_group_rule" "ingress_rules_cidr_blocks" {
  count = var.create_sg && length(var.ingress_rules_cidr_blocks) > 0 ? length(var.ingress_rules_cidr_blocks) : 0

  type      = "ingress"
  from_port = var.ingress_rules_cidr_blocks[count.index]["from_port"]
  to_port   = var.ingress_rules_cidr_blocks[count.index]["to_port"]
  protocol  = lookup(element(var.ingress_rules_cidr_blocks, count.index), "protocol", "tcp")
  cidr_blocks = [
  var.ingress_rules_cidr_blocks[count.index]["cidr_block"]]
  description = lookup(var.ingress_rules_cidr_blocks[count.index], "description", null)
  security_group_id = concat(aws_security_group.this.*.id, [
  ""])[0]
}

resource "aws_security_group_rule" "egress_rules_cidr_blocks" {
  count = var.create_sg && length(var.egress_rules_cidr_blocks) > 0 ? length(var.egress_rules_cidr_blocks) : 0

  type              = "egress"
  from_port         = var.egress_rules_cidr_blocks[count.index]["from_port"]
  to_port           = var.egress_rules_cidr_blocks[count.index]["to_port"]
  protocol          = lookup(element(var.egress_rules_cidr_blocks, count.index), "protocol", "tcp")
  cidr_blocks       = [var.egress_rules_cidr_blocks[count.index]["cidr_block"]]
  description       = lookup(var.egress_rules_cidr_blocks[count.index], "description", null)
  security_group_id = concat(aws_security_group.this.*.id, [""])[0]
}

resource "aws_security_group_rule" "ingress_rules_source_sg_id" {
  count = var.create_sg && length(var.ingress_rules_source_sg_id) > 0 ? length(var.ingress_rules_source_sg_id) : 0

  type                     = "ingress"
  from_port                = var.ingress_rules_source_sg_id[count.index]["from_port"]
  to_port                  = var.ingress_rules_source_sg_id[count.index]["to_port"]
  protocol                 = lookup(var.ingress_rules_source_sg_id[count.index], "protocol", "tcp")
  source_security_group_id = var.ingress_rules_source_sg_id[count.index]["source_security_group_id"]
  description              = lookup(var.ingress_rules_source_sg_id[count.index], "description", null)
  security_group_id        = concat(aws_security_group.this.*.id, [""])[0]
}

resource "aws_security_group_rule" "egress_rules_source_sg_id" {
  count = var.create_sg && length(var.egress_rules_source_sg_id) > 0 ? length(var.egress_rules_source_sg_id) : 0

  type                     = "egress"
  from_port                = var.egress_rules_source_sg_id[count.index]["from_port"]
  to_port                  = var.egress_rules_source_sg_id[count.index]["to_port"]
  protocol                 = lookup(element(var.egress_rules_source_sg_id, count.index), "protocol", "tcp")
  source_security_group_id = var.egress_rules_source_sg_id[count.index]["source_security_group_id"]
  description              = lookup(var.egress_rules_source_sg_id[count.index], "description", null)
  security_group_id        = concat(aws_security_group.this.*.id, [""])[0]
}
