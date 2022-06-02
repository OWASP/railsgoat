class VulnerablleScript
  def initialize(cmd)
    @cmd = cmd
    eval @cmd
  end

  def a
    `@cmd`
  end

  def b
    system(@cmd)
  end

  def c
    %x{cmd}
  end
end
